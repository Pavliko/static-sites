'use strict'

angular.module('app')
  .directive 'userInfo', ->
    restrict: 'E'
    templateUrl: 'views/user_info.html'
    replace: true
