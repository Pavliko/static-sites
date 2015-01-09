"use strict"
angular.module('app').directive "placeholder", ($parse) ->
  restrict: "A"
  scope:
    placeholder: '@'
    label: '@'
  link: (scope, element, attrs) ->
    text = scope.placeholder
    labelText = scope.label
    label = $("<label class=\"float-label\" for=\"#{attrs.id}\">#{text}</label>")
    parent = element.parent().addClass('float-label-wrapper')
    element.attr 'placeholder', ''
    element.addClass 'float-label-element'
    element.before label

    focus = ->
      label.text text
      label.addClass 'float-label--focused float-label--active'
    blur = ->
      if element.val().length
        label.text labelText
      else
        label.removeClass 'float-label--active'
      label.removeClass 'float-label--focused'


    element
      .on "focus", focus
      .on "blur", blur
    scope.$on "$destroy", ->
      label.remove()
      element
        .off "focus", focus
        .off "blur", blur
