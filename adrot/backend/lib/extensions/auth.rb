module Extensions
  module Auth
    AUTHORIZED_KEYS = {
      'JE7bqwtk7XwxDdpTnL' => 'Горлов Павел'
    }

    module Helpers
      def get_auth
        jsonp({success: true, data: session[:authorized], message: "Добро пожаловать #{session[:authorized]}!", type: :success})
      end

      def authorize!
        session[:authorized] = AUTHORIZED_KEYS[params[:key] || request.cookies['key']]
        halt 200, jsonp({
          success: false,
          status: 403,
          message: params[:key] ? 'Hеправильный ключ' : 'Необходимо авторизоваться'
        }) unless session[:authorized]
      end
    end

    def self.registered(app)
      app.helpers Auth::Helpers
      app.before do
        authorize!
      end

      app.get '/auth' do
        response.set_cookie('key', value: params[:key]) if params[:key]
        get_auth
      end
    end
  end
end
