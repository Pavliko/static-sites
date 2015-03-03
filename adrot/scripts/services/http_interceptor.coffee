# register the interceptor as a service
angular.module('app')
  .factory "httpInterceptor", ($q, Alerts) ->
    first_time: true
    response: (response) ->
      if window.DEBUG_XHR
        url = response.config.url
        console.debug url, response.data if url.indexOf('.html') == -1

      if typeof(response.data) == 'object'
        if response.data.success == false
          Alerts.addAlert(response.data.message, 'danger') if response.data.status == 403
          return $q.reject(response)
        else
          if response.data.error_code > 0
            message = "<b>#{response.data.error_str} (#{response.data.error_code})</b><br/>#{response.data.error_detail}"
            Alerts.addAlert(message, 'danger')
          else
            if response.data.message
              Alerts.addAlert(response.data.message, response.data.type || 'info')
      response
