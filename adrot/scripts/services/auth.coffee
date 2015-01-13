'use strict'

angular.module('app')
  .service 'Auth', ($http, ipCookie, Alerts, $location) ->
    authorized: null
    auth: (key=false) ->
      path = if key
        "/auth.json?key=#{key}&"
      else
        '/user_info.json?'

      $http.jsonp("#{path}callback=JSON_CALLBACK", ignoreLoadingBar: @authorized == null)
        .success (data) =>
          $location.path '/campaigns/create' unless @authorized
          @authorized = true
          @user = data.data
        .error (data) =>
          @authorized = false
          @user = null
          $location.path '/'

    log_out: ->
      ipCookie.remove('key')
      @authorized = false
      @user = null
      $location.path '/'
