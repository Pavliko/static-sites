angular.module('rdmApp').directive 'browser', ->
  restrict: 'A'
  templateUrl: 'views/browser.html'
  scope:
    text: '@browser'
  replace: true
  link: (scope, element) ->
    #console.log scope.text, element
