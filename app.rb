# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'

class BnB < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get('/') do
    session[:logged_in] = false if session[:logged_in].nil?
    @logged_in = session[:logged_in]
    erb(:index)
  end

  get('/sign-up') do
    erb(:sign_up)
  end

  get('/session') do
    erb(:log_in)
  end

  post('/new-user') do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if user.nil?
      redirect('/sign-up')
    else
      session[:logged_in] = true
      redirect('/')
    end
  end

  post('/session/new') do
    session[:logged_in] = User.authenticate(email: params[:email], password: params[:password])
    if session[:logged_in] == true
      redirect('/')
    else
      redirect('/session')
    end
  end
end
