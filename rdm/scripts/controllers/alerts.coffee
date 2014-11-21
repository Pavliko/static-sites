angular.module('rdmApp').controller 'AlertsCtrl', ($scope, $timeout, $location) ->
  angular.extend $scope,
    alerts: []
    closable: true
    closeAlert: (index) ->
        @alerts.splice index, 1 if _.isNumber(index)

    addAlert: (message, type='info') ->
      @alerts.push
        type: type
        message: message

      $timeout =>
        @closeAlert _.findIndex(@alerts, message: message)
      , 5000

  alertKeys =
    active: 'alert-active[]'
    success: 'alert-success[]'
    info: 'alert-info[]'
    warning: 'alert-warning[]'
    danger: 'alert-danger[]'

  params = $location.search()
  for type, key  of alertKeys
    if alerts = params[key]
      if _.isArray(alerts)
        $scope.addAlert(message, type) for message in alerts
      else
        $scope.addAlert(alerts, type)

      $location.search(key, null)
