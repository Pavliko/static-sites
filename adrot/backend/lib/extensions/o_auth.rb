module Extensions
  module OAuth
    module Helpers
      def oauth_config
        {
          'yandex' => yandex_config
        }
      end
    end

    def self.registered(app)
      app.helpers OAuth::Helpers

      app.namespace '/oauth' do
        get '' do
          halt 404 unless params[:engine]
          config = oauth_config[params[:engine]]
          redirect to(config['auth_url'] % config['client_id'])
        end

        get '/callback' do
          halt 404 unless params[:engine]
          config = oauth_config[params[:engine]]

          begin
            res = RestClient.post(config['token_url'],
              grant_type: :authorization_code,
              code: params['code'],
              client_id: config['client_id'],
              client_secret: config['client_secret']
            )
          rescue
            url = URI.escape(config['auth_url'] % config['client_id'], Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
            redirect to("http://#{request.host}/oauth/error?url=#{url}")
          end

          json = Oj.load(res.body)
          
          response.set_cookie "#{params[:engine]}_token", value: json['access_token'], path: ?/
          simple_page('<script>window.close();</script>')
        end

        get '/error' do
          halt 200, simple_page("<h1>Произошла ошибка <a href=\"#{params['url']}\">попробовать ещё раз</a>")
        end
      end
    end
  end
end
