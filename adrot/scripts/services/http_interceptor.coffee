# register the interceptor as a service
angular.module('app')
  .factory "httpInterceptor", ($q, Alerts) ->
    first_time: true
    response: (response) ->
      if typeof(response.data) == 'object'
        if response.data.success == false
          Alerts.addAlert(response.data.message, 'danger') if response.data.status == 403
          return $q.reject(response)
        else
          if response.data.message
            Alerts.addAlert(response.data.message, response.data.type || 'info')
      response
