'use strict'

###*
 # @ngdoc overview
 # @name rdmApp
 # @description
 # # rdmApp
 #
 # Main module of the application.
###
angular.module('rdmApp', [
  'ngAnimate'
  'ngCookies'
  'ngSanitize'
  'ngTouch'
  'ui.bootstrap'
  'angular-inview'
]).config ($locationProvider) ->
