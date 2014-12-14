'use strict'

###*
 # @ngdoc function
 # @name rdmApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the rdmApp
###
angular.module('rdmApp').controller 'MainCtrl', ($scope, $location, $anchorScroll) ->
  $scope.scrollTo = (id) ->
    $location.hash(id)
    $anchorScroll()
