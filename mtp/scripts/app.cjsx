'use strict'

###*
 # @ngdoc overview
 # @name simple-webapp
 # @description
 # simple-webapp
 #
 # Main module of the application.
###

Balance = React.createClass
  getDefaultProps: ->
    balance:
      balance: ''
      currency: ''
  componentDidMount: ->
    ajax 'http://tp.local/tp-api/v2/statistics/balance?token=6a7a75e1df0525a7d358ad60ba454f1e',
      success: (data) =>
        data = JSON.parse data
        @setProps balance: data.data

  render: ->
    <h2>{@props.balance.balance} {@props.balance.currency}</h2>


React.renderComponent <Balance />, document.getElementById('example')
