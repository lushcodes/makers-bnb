# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/userç'

class BnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get ('/') do
    erb(:index)
  end

  get ('/sign-up') do
    erb(:sign_up)
  end

  post ('/new-user') do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect('/')
  end
end
