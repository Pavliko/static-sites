'use strict'

angular.module('app')
  .directive 'yandexDirect', (DirectAPI, $timeout) ->
    restrict: 'E'
    templateUrl: 'views/yandex_direct.html'
    replace: true
    link: (scope, element, attrs) ->
      angular.extend scope,
        yandexDirectAuth: false
        checkCount: 0
        doPing: false

        ping: ->
          return if @doPing || @yandexDirectAuth
          @doPing = true
          DirectAPI.ping (result) =>
            @yandexDirectAuth = result
            @doPing = false

        checkCokie: (initial=false) ->
          @checkCount = 0 if initial
          @ping()
          $timeout (=> @checkCokie()), 200 if @checkCount++ < 1500 && !@yandexDirectAuth

      scope.ping()
