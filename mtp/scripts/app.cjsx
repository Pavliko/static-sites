'use strict'

###*
 # @ngdoc overview
 # @name simple-webapp
 # @description
 # simple-webapp
 #
 # Main module of the application.
###

MTravelpayouts = React.createClass
  componentWillMount: ->
    # ?token=6a7a75e1df0525a7d358ad60ba454f1e
  render: ->
    <div>
      <header>
      </header>
      <Balance />
      <a href="#" className="settings-link"><i className="icon-gear"> </i></a>
    </div>

Balance = React.createClass
  getInitialState: ->
    balance:
      balance: '1'
      currency: 'RUB'
  componentWillMount: ->
    # Cache.fetchJSONP 'http://m-travelpayouts.pavliko.com/auth?callback=asd&token=6a7a75e1df0525a7d358ad60ba454f1e', (d) ->
    #   document.write d
    # Cache.fetchJSONP 'http://m-travelpayouts.pavliko.com/api/v2/statistics/balance', (data) =>
    #   @setState balance: data
  update: ->
    @setState balance:
      balance: 'UPDATING'
      currency: ''

    Cache.fetchJSONP 'http://m-travelpayouts.pavliko.com/api/v2/statistics/balance', (data) =>
      console.log data
      @setState balance: data
  reloadPage: ->
    window.location.reload()
  render: ->
    <div>
      <span>{@state.balance.balance} {@state.balance.currency}</span>
      <br />
      <button onClick={@update}>update balance</button>
      <br />
      <button onClick={@reloadPage}>reload page</button>
    </div>

# document.addEventListener 'deviceready', ->
React.renderComponent <MTravelpayouts />, document.body
# , false
