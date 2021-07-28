require 'pg'
require_relative 'space'

class Booking

  attr_reader :name, :description, :price   

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end

  def self.create(id:)
    selected_space = Space.find_space(id: id)
    conn = if ENV['RACK_ENV'] == 'test'
        PG.connect(dbname: 'bnb_test')
      else
        PG.connect(dbname: 'bnb')
      end
      result = conn.exec("INSERT INTO bookings (name, description, price) 
      VALUES('#{selected_space.name}', '#{selected_space.description}', '#{selected_space.price}') RETURNING name, description, price;")
      Booking.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
    end
end
