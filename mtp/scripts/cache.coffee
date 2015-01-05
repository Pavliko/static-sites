window.Cache =
  get: $.jStorage.get
  set: (key, value, ttl=5) ->
    $.jStorage.set key, value
    $.jStorage.setTTL key, (ttl * 60 * 1000) if ttl
    value
  delete: $.jStorage.deleteKey
  fetch: (key, generator, ttl=5) ->
    result = @get key
    return result if result
    @set key, generator(), ttl
  defaultTransform: (json) ->
    if json.success && json.data then json.data else json
  fetchJSONP: (url, callback, transform=Cache.defaultTransform, ttl=5)->
    result = @get url
    return callback(result) if result
    try
      JSONP url, (json) =>
        data = transform(json)
        callback(data)
        @set(url, data, ttl)
    catch error
      document.write 'error ' + error
