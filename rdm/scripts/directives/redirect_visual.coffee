angular.module('rdmApp').directive 'redirectVisual', ->
  restrict: 'C'
  templateUrl: 'views/redirect_visual.html'
  scope:
    origin: '@redirectVisualOrigin'
    destination: '@redirectVisualDestination'
  link: (scope, element) ->
    #console.log scope.text, element
