require 'rubygems'
require 'sinatra/base'
require 'sinatra/jsonp'
require 'sinatra/json'
require './lib/parser'


class MyApp < Sinatra::Base
  helpers Sinatra::Jsonp
  use Rack::Session::Cookie,
    expire_after: 31104000, # In seconds
    secret: 'adrot_torda'

  attr_reader :authorized

  AUTHORIZED_KEYS = {
    'JE7bqwtk7XwxDdpTnL' => 'Горлов Павел'
  }

  before do
    authorize!
  end

  get '/auth.json' do
    response.set_cookie('key', value: params[:key]) if params[:key]
    get_auth
  end

  get '/user_info.json' do
    get_auth
  end

  post '/parse' do
    json Parser.new(JSON.parse(request.body.read)).parse
  end

  def get_auth
    jsonp({success: true, data: authorized, message: "Добро пожаловать #{authorized}!", type: :success})
  end

  def authorize!
    @authorized = AUTHORIZED_KEYS[params[:key] || request.cookies['key']]
    message = request.path_info == '/auth' ? 'Hеправильный ключ' : 'Необходимо авторизоваться'
    halt 200, jsonp({success: false, status: 403, message: message}) unless authorized
  end
end
