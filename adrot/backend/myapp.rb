require 'rubygems'
require 'bundler'
Bundler.require

require './lib/extensions/parser'
require './lib/extensions/auth'
require './lib/extensions/yandex_direct'
require './lib/extensions/o_auth'
require './lib/parser'

class MyApp < Sinatra::Base
  helpers Sinatra::Jsonp
  use Rack::Session::Cookie, expire_after: 31104000, secret: 'adrot_torda'

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
