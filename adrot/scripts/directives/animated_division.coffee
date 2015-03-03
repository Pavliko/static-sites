# "use strict"
# angular.module('app').directive "animatedDivision", ($rootScope) ->
#   restrict: "A"
#   link: (scope, element, attrs) ->
#     [___, itemId, collectionId] = attrs.ngRepeat.match(/(\w+)\s+in\s+([^\s]+)/)
#     return unless itemId && collectionId
# 
#     element.addClass('animated-division')
#
#
#     childs = element.find('input, textarea')
#     newValue = {}
#     console.log 'link'
#     for el in childs
#       modelId = el.getAttribute('ng-model')
#       eval("#{modelId.replace(itemId, 'newValue')} = ''") if modelId.indexOf(itemId) == 0
#
#     childs.on 'focus', ->
#       collection = eval("scope.#{collectionId}")
#       index = parseInt(attrs.animatedDivision, 10)
#       console.log collection,index, @.getAttribute('id')
#       collection.push newValue if collection.length == index + 1
#       console.log collection
#
#     childs.on 'blur', ->
#       collection = eval("scope.#{collectionId}")
#       return unless collection.length > 1
#       lastElement = collection[collection.length - 2]
#       if _.every(_.keys(lastElement), ((key) -> key == '$$hashKey' || _.isEmpty(lastElement[key])))
#         console.log 'pop'
#         eval("scope.#{collectionId}.pop()")
#         @blur()
