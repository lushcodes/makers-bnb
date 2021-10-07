require 'pg'
require_relative 'space'

class Booking

  attr_reader :name, :description, :price, :user_id, :start_date, :end_date
  def initialize(name:, description:, price:, user_id:, start_date:, end_date:)
    @user_id = user_id
    @name = name
    @description = description
    @price = price
    @start_date = start_date
    @end_date = end_date
  end

  def self.create(id:, user_id:, start_date:, end_date:)
    selected_space = Space.find_space(id: id)
    conn = if ENV['RACK_ENV'] == 'test'
        PG.connect(dbname: 'bnb_test')
      else
        PG.connect(dbname: 'bnb')
      end
    result = conn.exec("INSERT INTO bookings (name, description, price, booking_user_id, start_date, end_date) 
      VALUES('#{selected_space.name}', '#{selected_space.description}', '#{selected_space.price}', '#{user_id}', '#{start_date}', '#{end_date}') 
      RETURNING booking_user_id, name, description, price, start_date, end_date;")
      newbooking = Booking.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], user_id: result[0]['booking_user_id'], start_date: result[0]['start_date'], end_date: result[0]['end_date']) 
    newbooking
    end
end
