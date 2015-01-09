'use strict'

angular.module('app')
  .directive 'auth', ->
    restrict: 'E'
    templateUrl: 'views/auth.html'
    replace: true
