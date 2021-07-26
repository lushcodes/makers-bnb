# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

class BnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get ('/') do
    erb(:index)
  end
end
