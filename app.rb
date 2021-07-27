# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

class BnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get('/') do
    erb(:index)
  end

  get('/add_space') do
    erb(:space_form)
  end

  post('/listings') do
    @name = params['name']
    @description = params['description']
    @price = params['ppn']
    erb(:properties)
  end
end
