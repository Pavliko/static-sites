require 'rubygems'

module Extensions
  module YandexDirect
    URL = 'https://api-sandbox.direct.yandex.ru/v4/json/'

    def self.registered(app)
      Yandex::API::Direct.load './config/yandex_direct.yml'
      app.namespace '/direct' do
        get '/ping' do
          response = RestClient.post URL, JSON.generate({
              method: 'PingAPI',
              token: request.cookies['yandex_token'],
              locale: :ru
            }), {content_type: 'application/json', accept: :json}
          json Oj.load(response.body)
        end
      end
    end
  end
end
