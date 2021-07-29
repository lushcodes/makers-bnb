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
    erb(:index)
  end

  ## Sign up, log in, log out
  get('/sign-up') do
    erb(:sign_up)
  end

  post('/new-user') do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if user.nil?
      redirect('/sign-up')
    else
      session[:logged_in] = true
      session[:user_id] = user.id
      redirect('/')
    end
  end

  get('/session') do
    erb(:log_in)
  end

  post('/session/new') do
    session[:logged_in] = User.authenticate(email: params[:email], password: params[:password])
    if session[:logged_in] == true
      user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = user.id
      redirect('/')
    else
      redirect('/session')
    end
  end

  get('/space/new') do
    erb(:space_form)
  end

  post('/listings') do
    p "the id is #{session[:user_id]}"
    Space.create(name: params[:name], description: params[:description], price: params[:price], user_id: session[:user_id])
    redirect '/allspaces'
  end

  get('/allspaces') do
    @logged_in = session[:logged_in]
    @spaces = Space.list
    erb(:properties)
  end

  post('/bookings/{id}') do
    p "the id is #{session[:user_id]}"
    @booking = Booking.create(id: params[:space_id], user_id: session[:user_id])
    erb(:bookings)
  end

  get('/logout') do
  session[:logged_in] = false
  session[:user_id] = nil
  redirect '/'
  end
end
