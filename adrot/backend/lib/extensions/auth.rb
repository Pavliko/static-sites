module Extensions
  module Auth
    AUTHORIZED_KEYS = {
      'JE7bqwtk7XwxDdpTnL' => {
        id: 0,
        name: 'Горлов Павел',
        yandex_logins: ['pavel0788']
      },
      'kWfbjBfq9m38yreDep' => {
        id: 1,
        name: 'Валентина Стефаненко',
        yandex_logins: ['yopsta.ru']
      },
      'HkKPuUKsTf2ss33Ypc' => {
        id: 2,
        name: 'Татьяна Зуйкова',
        yandex_logins: ['zuykovat']
      },
      'n2HAkv6Pk3AWDsaMib' => {
        id: 3,
        name: 'Яндекс.Директ',
        yandex_logins: ['direct']
      },
      'free' => {
        id: 4,
        name: 'Уважаемый Пользоывтель',
        yandex_logins: ['direct']
      }
    }

    module Helpers
      def get_auth
        json({success: true, data: @user[:authorized], message: "Добро пожаловать #{@user[:name]}!", type: :success})
      end

      def authorize!
        @user = AUTHORIZED_KEYS[params[:key] || request.cookies['key']]
        halt 200, json({
          success: false,
          status: 403,
          message: params[:key] ? 'Hеправильный ключ' : 'Попробуй, не пожалеешь!'
        }) unless @user
      end
    end

    def self.registered(app)
      app.helpers Auth::Helpers

      app.before do
        authorize!
      end

      app.get '/auth' do
        response.set_cookie('key', app.settings.cookie_options.merge(value: params[:key])) if params[:key]
        get_auth
      end
    end
  end
end
