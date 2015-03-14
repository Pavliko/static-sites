require 'rubygems'

module Extensions
  module YandexDirect
    SANDBOX_URL = 'https://api-sandbox.direct.yandex.ru/v4/json/'
    URL = 'https://api.direct.yandex.ru/v4/json/'
    LOCALE = :ru
    TTL = 604800

    module Helpers
      def token
        request.cookies['yandex_token']
      end

      def yandex_config
        @yandex_config ||= YAML.load(File.read('config/yandex_direct.yml'))
      end

      def yandex_api_request method, param={}
        resp = RestClient.post URL, JSON.generate({
          method: method,
          token: token,
          locale: LOCALE
        }.merge(param: param)), {content_type: 'application/json', accept: :json}

        Oj.load(resp.body)
      end

      def cached_yandex_api_request method, param={}, ttl = TTL
        digest = params.empty? ? 'digest' : Digest::MD5.digest(params.values.join(?:))
        cache_key = "yd:#{token}:#{method}:#{digest}"


        if params[:clear_cache] != 'true' && cached = $redis.get(cache_key)
          Oj.load cached
        else
          result = yandex_api_request method, param
          unless result['error_code']
            $redis.set cache_key, Oj.dump(result)
            $redis.expireat cache_key, Time.now.to_i + ttl
          end
          result
        end
      end

      def logins
        @user[:yandex_logins]
      end
    end

    def self.registered(app)
      app.helpers YandexDirect::Helpers

      app.namespace '/direct' do
        get '/ping' do
          json cached_yandex_api_request('PingAPI', {}, 3600)
        end

        get '/campaigns' do
          json cached_yandex_api_request('GetCampaignsList', logins)
        end

        get '/banners' do
          param = {}
          param[:CampaignIDS] = params[:CampaignIDS] if params[:CampaignIDS]
          param[:BannerIDS] = params[:BannerIDS] if params[:BannerIDS]

          json cached_yandex_api_request('GetBanners', param)
        end

        post '/banners' do
          data = Oj.load(request.body.read)
          banners = []
          data['banners'].each do |banner|
            pharses = []
            if banner['pharses'] || !banner['pharses'].empty? && data['pharsePrice'].to_f > 0
              banner['pharses'].split(?;).each do |pharse|
                pharses << {
                  PhraseID: 0,
                  Phrase: pharse,
                  Price: data['pharsePrice']
                }
              end
            end

            href = data['href']
            separator = data['href'].include?(??) ? ?& : ??
            url_params = []
            url_params << "utm_source=#{URI::encode(data['utmSource'])}" if data['utmSource']
            url_params << "utm_medium=#{URI::encode(data['utmMedium'])}" if data['utmMedium']
            url_params << "utm_term=#{URI::encode(banner['utmTerm'])}" if banner['utmTerm']
            href = "#{href}#{separator}#{url_params.join(?&)}" unless url_params.empty?

            item = {
              BannerID: 0,
              CampaignID: data['campaignId'],
              Title: banner['title'],
              Text: banner['body'],
              Geo: 0,
              Href: href,
            }

            item[:Phrases] = pharses unless pharses.empty?

            banners << item
          end

          json yandex_api_request('CreateOrUpdateBanners', banners)
        end
      end
    end
  end
end
