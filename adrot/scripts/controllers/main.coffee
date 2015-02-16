'use strict'

angular.module('app')
  .controller 'MainCtrl', ($scope, $http, Auth, Alerts) ->
    $scope.authorization = Auth
    $scope.alerts = Alerts
    $scope.loading = 0
    Auth.auth()

    $scope.$on 'cfpLoadingBar:started', -> $scope.loading++

    $scope.$on 'cfpLoadingBar:completed', -> $scope.loading--
