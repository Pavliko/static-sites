'use strict'

angular.module('app')
  .controller 'MainCtrl', ($scope, $http, Auth, Alerts) ->
    $scope.authorization = Auth
    $scope.alerts = Alerts
    Auth.auth()
