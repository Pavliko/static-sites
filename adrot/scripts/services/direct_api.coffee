'use strict'

angular.module('app')
  .service 'DirectAPI', ($http, ipCookie) ->
    url: '/direct/ping'
    cookieKey: 'yandex_token'
    ping: (callback) ->
      return callback(false) unless ipCookie(@cookieKey)
      $http.get(@url).success (data) =>
        authorized = data.data == 1
        ipCookie.remove(@cookieKey) unless authorized
        callback(authorized)

    logOut: -> ipCookie.remove(@cookieKey)
