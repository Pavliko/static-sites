require 'rubygems'
require 'bundler'
Bundler.require
require 'sinatra/cookies'
require 'sinatra/namespace'
require "sinatra/json"
require 'yaml'
require 'digest/md5'

$root = File.expand_path(File.dirname(__FILE__))
$redis = Redis.new(db: 5)

$LOAD_PATH.unshift($root + '/lib')
require 'extensions/parser'
require 'extensions/auth'
require 'extensions/yandex_direct'
require 'extensions/o_auth'
require 'parser'

module Oj
  class << self
    alias :encode :dump
    alias :decode :load
  end
end
Oj.default_options = { mode: :compat }

class MyApp < Sinatra::Base
  set :json_content_type, 'application/json; charset=utf-8'
  set :json_encoder, Oj
  set(:cookie_options) do
    {
      expires: Time.now + 31536000,
      path: ?/
    }
  end


  helpers Sinatra::JSON
  helpers Sinatra::Cookies
  disable :sessions

  register Sinatra::Namespace
  register Extensions::Auth
  register Extensions::Parser
  register Extensions::YandexDirect
  register Extensions::OAuth

  def simple_page content
    <<eos
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <style>
      <link rel="stylesheet" href="/styles/main.css">
    </style>
  </head>
  <body>
    #{content}
  </body>
</html>
eos
  end
end
