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
      redirect('/')
    end
  end

  get('/session') do
    erb(:log_in)
  end

  post('/session/new') do
    session[:logged_in] = User.authenticate(email: params[:email], password: params[:password])
    if session[:logged_in] == true
      redirect('/')
    else
      redirect('/session')
    end
  end

  get('/space/new') do
    erb(:space_form)
  end

  post('/listings') do
    Space.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/allspaces'
  end

  get('/allspaces') do
    @logged_in = session[:logged_in]
    @spaces = Space.list
    erb(:properties)
  end

  post('/bookings/{id}') do
    @booking = Booking.create(id: params[:space_id])
    erb(:bookings)
  end

  get('/logout') do
  session[:logged_in] = false
  redirect '/'
  end
end
