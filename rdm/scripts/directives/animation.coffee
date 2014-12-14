angular.module('rdmApp').directive 'animation', ($timeout) ->
  restrict: 'A'
  templateUrl: 'views/animation.html'
  replace: true
  transclude: true
  cleared: false
  scope:
    duration: '@animationDuration'
  link: (scope, element, attrs) ->
    angular.extend scope,
      infinite: attrs.animationRepeat == "infinite"
      count: 0
      limit: parseInt(attrs.animationRepeat)
      startTime: false
      startOffset: 0
      paused: false
      init: _.once ->
        element.css('animation-duration', "#{@duration}ms")
        element.removeClass('animation--initialization')
        @promiseToStop()
      toggleState: (event) ->
        if scope.paused then @doStart() else @doStop()
        return
      doStop: ->
        @paused = true
        @startOffset = (new Date) - @startTime
        $timeout.cancel @promise
      doStart: ->
        @paused = false
        @cleared = false
        @startTime = (new Date) - @startOffset
        @promiseToStop()
      promiseToStop: ->
        @startTime ||= new Date
        diff = new Date - @startTime

        @promise = $timeout =>
          @timeOut()
        , @duration - diff
      timeOut: ->
        @count++
        @paused = true unless @need_repeat()
        @startOffset = 0
        @startTime = false
        @cleared = true
        $timeout (=> @doStart()), 50 if @need_repeat()
      need_repeat: ->
        @infinite || (@limit > 0 && @count < @limit)
