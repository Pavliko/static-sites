'use strict'

angular.module('app')
  .service 'DirectAPI', ($http, ipCookie, Alerts) ->
    cookieKey: 'yandex_token'
    campaigns: []
    authorized: false
    queue: []
    ping: (callback) ->
      return callback(@authorized = false) unless ipCookie(@cookieKey)
      $http.get('/direct/ping').success (data) =>
        @authorized = data.data == 1
        if @authorized
          @runQueue()
        else
          ipCookie.remove(@cookieKey)
        callback(@authorized)

    getCampaigns: ->
      if @authorized
        $http.get('/direct/campaigns').success (data) => @campaigns = data.data
      else
        @queue.push => @getCampaigns()

    runQueue: ->
      proc.call() for proc in @queue

    logOut: -> ipCookie.remove(@cookieKey)

    saveBanners: (data)->
      $http.post('/direct/banners', data).success (data) ->
        Alerts.addAlert "<b>Объявления успешно созданы</b> #{data.data.join(', ')}", 'success'
