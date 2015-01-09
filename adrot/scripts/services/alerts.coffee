angular.module('app')
  .service 'Alerts', ($timeout, $location) ->
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
      , 2500
