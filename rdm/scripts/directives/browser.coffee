angular.module('rdmApp').directive 'browser', ->
  restrict: 'E'
  templateUrl: 'views/browser.html'
  scope:
    text: '@browserText'
    class: '@class'
  replace: true
  transclude: true
  link: (scope, element) ->
    # console.log scope.text, element
