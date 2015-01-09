'use strict'


angular
  .module('app', [
    'angular-loading-bar'
    'ipCookie'
    'ngAnimate'
    'ngSanitize'
    'ngTouch'
    'ngRoute'
    'ui.bootstrap'
  ])
  .config (cfpLoadingBarProvider, $httpProvider, $routeProvider, $locationProvider) ->
    cfpLoadingBarProvider.includeSpinner = false
    $httpProvider.interceptors.push "httpInterceptor"
    # $locationProvider.html5Mode true

    $routeProvider
      .when '/',
        templateUrl: 'views/auth.html'
      .when '/campaigns/create',
        templateUrl: 'views/campaigns/create.html'
