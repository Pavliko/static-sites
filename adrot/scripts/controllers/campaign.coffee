'use strict'

angular.module('app')
  .controller 'CampaignCtrl', ($scope, $http, DirectAPI, $timeout) ->
    TEST_DATA =
      utmSource: 'ADrot'
      utmMedium: 'cpc'
      pharsePrice: 0.1
      campaign:
        pageUrl: 'http://www.ulmart.ru/goods/604875'
        selectors: [
          {selector: 'title'}
          {selector: 'h1'}
          {selector: '.b-product-card__price [itemprop="price"]'}
          {selector: '.b-crumbs [itemprop=url] [itemprop=title]'}
          {selector: '.b-art__num'}
          {}
        ]
        advertisements: [
            title: 'Купи %{h1} сегодня!'
            body: 'Купи %{h1} всего за  %{2}'
            pharses: '%{3}'
            utmTerm: '%{.b-art__num}'
          {}
        ]

    angular.extend $scope,
      directAPI: DirectAPI
      banners: [{}]
      campaign:
        pageUrl: null
        selectors: [{}]
        advertisements: [{}]

      setTestData: ->
        angular.extend this, TEST_DATA
        $timeout (-> $scope.$broadcast 'placeholderTouch'), 50

      focusCollection: (collection, index, newValue={}) ->
        collection.push newValue if collection.length == index + 1

      blurCollection: (collection) ->
        return unless collection.length > 1
        lastElement = collection[collection.length - 2]
        if _.every(_.keys(lastElement), ((key) -> key == '$$hashKey' || _.isEmpty(lastElement[key])))
          collection.splice(collection.length - 1, 1)
          @blurCollection(collection)

      focusSelector: (index) -> @focusCollection @campaign.selectors, index
      blurSelector: -> @blurCollection @campaign.selectors

      focusAdvertisement: (index) -> @focusCollection @campaign.advertisements, index
      blurAdvertisement: -> @blurCollection @campaign.advertisements

      focusBanner: (index) -> @focusCollection @banners, index
      blurBanner: -> @blurCollection @banners

      parseAds: ->
        $http.post '/parse', {camaign: @campaign}, {headers: { 'Content-Type': 'application/json'}}
          .success (data) =>
            @banners.unshift(banner) for banner in data

      saveBanners: ->
        DirectAPI.saveBanners
          campaignId: @campaignId
          utmSource: @utmSource
          utmMedium: @utmMedium
          pharsePrice: @pharsePrice
          href: @campaign.pageUrl
          banners: _.slice(@banners, 0, -1)
