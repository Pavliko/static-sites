"use strict"
angular.module('app').directive "placeholder", ($parse, $timeout) ->
  restrict: "A"
  link: (scope, element, attrs) ->
    text = attrs.placeholder
    labelText = attrs.label || text
    sizing = " float-label--#{sizing[1]}" if sizing = attrs.class.match(/input-(sm|lg)/)

    label = angular.element("<label class=\"float-label#{sizing || ''}\" for=\"#{attrs.id}\">#{text}</label>")
    parent = element.parent().addClass('float-label-wrapper')
    element.attr 'placeholder', ''
    element.addClass 'float-label-element'
    parent.prepend(label)


    focus = ->
      label.text text
      label.addClass 'float-label--focused float-label--active'
      parent.addClass 'float-label-wrapper--focused'

    blur = ->
      if element.val().length
        label.text labelText
      else
        label.removeClass 'float-label--active'
      label.removeClass 'float-label--focused'
      parent.removeClass 'float-label-wrapper--focused'


    element
      .on "focus", focus
      .on "blur", blur

    scope.$on 'placeholderTouch', ->
      focus()
      blur()

    # scope.$on "$destroy", ->
    #   label.remove()
    #   element
    #     .off "focus", focus
    #     .off "blur", blur


    $timeout ->
      if element.val().length
        label.text labelText
        label.addClass 'float-label--active'
    , 50
