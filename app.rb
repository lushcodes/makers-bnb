# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/space'

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
      Space.create(name: params[:name], description: params[:description], price: params[:price])
      @spaces = Space.list
      erb(:properties)
  end

  post('/bookings') do
    erb(:bookings)
  end
end
