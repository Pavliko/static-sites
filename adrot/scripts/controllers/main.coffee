'use strict'

angular.module('app')
  .controller 'MainCtrl', ($scope, $http, Auth, Alerts) ->
    $scope.authorization = Auth
    $scope.alerts = Alerts
    $scope.loading = 0
    $scope.authKey = 'free'
    Auth.auth()

    $scope.$on 'cfpLoadingBar:loading', -> $scope.loading++

    $scope.$on 'cfpLoadingBar:loaded', -> $scope.loading--
