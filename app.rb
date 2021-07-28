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

  get('/add_space') do
    erb(:space_form)
  end

  post('/listings') do
    Space.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/allspaces'
  end

  get('/allspaces') do
    @spaces = Space.list
    erb(:properties)
  end

  post('/bookings') do
    @booking = Booking.create(id: params[:space_id])
    erb(:bookings)
  end
end
