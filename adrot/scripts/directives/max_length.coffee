"use strict"
angular.module('app').directive "maxLength", ($parse, $timeout) ->
  restrict: "A"
  link: (scope, element, attrs) ->
    maxLength = attrs.maxLength
    sizing = " max-length-indicator--#{sizing[1]}" if sizing = attrs.class.match(/input-(sm|lg)/)

    indicator = angular.element("<div class=\"max-length-indicator#{sizing || ''}\">#{element.val().length}/#{maxLength}</div>")
    parent = element.parent().addClass('max-length-indicator-wrapper')
    parent.prepend(indicator)

    element.on 'change keyup', ->
      currenntLength = element.val().length
      invalid = currenntLength > maxLength
      if invalid
        indicator
          .removeClass('max-length-indicator--valid')
          .addClass('max-length-indicator--invalid')
      else
        indicator
          .addClass('max-length-indicator--valid')
          .removeClass('max-length-indicator--invalid')
          
      indicator.html("#{currenntLength}/#{maxLength}")

    $timeout ->
      element.trigger('change')
    , 50
