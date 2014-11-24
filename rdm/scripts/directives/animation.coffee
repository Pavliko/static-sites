angular.module('rdmApp').directive 'animation', ($cookies) ->
  restrict: 'A'
  templateUrl: 'views/animation.html'
  replace: true
  transclude: true
  link: (scope, element) ->
    $cookies.animationPaused = scope.paused = ($cookies.animationPaused || element.attr('animation-paused')) == 'true'

    element.addClass('animation--initialized')
    scope.toggleState = (event) ->
      $cookies.animationPaused = scope.paused = !scope.paused
      return
    # console.log scope.text, element
