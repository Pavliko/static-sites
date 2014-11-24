angular.module('rdmApp').directive 'point', ->
  restrict: 'A'
  templateUrl: 'views/point.html'
  replace: true
  transclude: true
  link: (scope, element) ->
    # console.log element
