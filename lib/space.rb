# frozen_string_literal: true

require 'pg'
require './app'

class Space
  attr_reader :name, :description, :price

  # user_id:, available? to be added
  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end

  def self.create(name:, description:, price:)
    conn = if ENV['RACK_ENV'] == 'test'
             PG.connect(dbname: 'bnb_test')
           else
             PG.connect(dbname: 'bnb')
           end

    result = conn.exec("INSERT INTO spaces (name, description, price)
    VALUES('#{name}', '#{description}', '#{price}') RETURNING space_id, name, description, price;")
    Space.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price']) 
  end

  def self.list
    conn = if ENV['RACK_ENV'] == 'test'
             PG.connect(dbname: 'bnb_test')
           else
             PG.connect(dbname: 'bnb')
           end

    result = conn.exec('SELECT * FROM spaces;')
    # p result
    result.map do |space|
      Space.new(name: space['name'], description: space['description'], price: space['price'])
    end
  end
end
