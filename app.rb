# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require './lib/space'
require './lib/booking'

class BnB < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  ## Home route
  get('/') do
    session[:logged_in] = false if session[:logged_in].nil?
    @logged_in = session[:logged_in]
    @random_spaces = Space.list.sample(5)
    erb(:index)
  end

  ## Sign up, log in, log out
  get('/user/new') do
    erb(:'user/signup')
  end

  post('/new-user') do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if user.nil?
      redirect('user/new')
    else
      session[:logged_in] = true
      session[:user_id] = user.id
      redirect('/')
    end
  end

  get('/session') do
    erb(:'user/login')
  end

  post('/session/new') do
    session[:logged_in] = User.authenticate(email: params[:email], password: params[:password])
    if session[:logged_in] == true
      user = User.find(email: params[:email])
      session[:user_id] = user.id
      redirect('/')
    else
      redirect('/session')
    end
  end

  get('/space/new') do
    erb(:'space/new')
  end

  post('/space') do
    Space.create(name: params[:name], description: params[:description], price: params[:price], user_id: session[:user_id])
    redirect '/allspaces'
  end

  get('/allspaces') do
    @logged_in = session[:logged_in]
    @spaces = Space.list
    erb(:'space/index')
  end

  post('/bookings/{id}') do
    @booking = Booking.create(id: params[:space_id], user_id: session[:user_id])
    erb(:'booking/confirmation')
  end

  get('/logout') do
  session[:logged_in] = false
  session[:user_id] = nil
  redirect '/'
  end
end
