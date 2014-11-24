angular.module('rdmApp').directive 'animation', ->
  restrict: 'A'
  templateUrl: 'views/animation.html'
  replace: true
  transclude: true
  link: (scope, element) ->
    scope.paused = (element.attr('animation-paused') == 'true')
    element.addClass('animation--initialized')
    scope.toggleState = (event) ->
      scope.paused = !scope.paused
      return
    # console.log scope.text, element
