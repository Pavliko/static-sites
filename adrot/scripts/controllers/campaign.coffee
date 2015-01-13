'use strict'

angular.module('app')
  .controller 'CampaignCtrl', ($scope, $http, Auth, Alerts) ->
    angular.extend $scope,
      campaign:
        name: 'Кампания №1'
        pageUrl: 'http://www.ulmart.ru/goods/958234'
        selectors: [
          {selector: 'title'}
          {selector: 'h1'}
          {selector: '.b-product-card__price [itemprop="price"]'}
          {selector: ''}
        ]
        advertisements: [
            title: 'Купи %{h1} сегодня!'
            body: 'Купи %{h1} всего за  %{2}'
          ,
            title: ''
            body: ''
        ]
      focusSelector: (index) ->
        @campaign.selectors.push selector: '' if @campaign.selectors.length == index + 1
      blurSelector: ->
        if _.isEmpty(@campaign.selectors[@campaign.selectors.length - 2].selector)
          @campaign.selectors.splice(@campaign.selectors.length - 1, 1)
          @blurSelector()
      focusAdvertisement: (index) ->
        @campaign.advertisements.push {title: '', body: ''} if @campaign.advertisements.length == index + 1
      blurAdvertisement: ->
        pp_ad = @campaign.advertisements[@campaign.advertisements.length - 2]
        if _.isEmpty(pp_ad.title) && _.isEmpty(pp_ad.body)
          @campaign.advertisements.splice(@campaign.advertisements.length - 1, 1)
          @blurAdvertisement()
      parseAds: ->
        $http.post '/parse', {camaign: @campaign}, {headers: { 'Content-Type': 'application/json'}}
          .success (data) ->
            console.log data
