'use strict'

angular.module('app')
  .directive 'userNav', ->
    restrict: 'E'
    templateUrl: 'views/user_nav.html'
    replace: true
    link: (scope, element, attrs) ->
      
