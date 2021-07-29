# frozen_string_literal: true

require 'pg'
require './app'

class Space
  attr_reader :name, :description, :price, :space_id

  # user_id:, available? to be added
  def initialize(space_id:, name:, description:, price:)
    @space_id = space_id
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
    Space.new(space_id: result[0]['space_id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
  end

  def self.find_space(id:)
    conn = if ENV['RACK_ENV'] == 'test'
        PG.connect(dbname: 'bnb_test')
      else
        PG.connect(dbname: 'bnb')
      end
    result = conn.exec("SELECT * FROM spaces WHERE space_id = '#{id}';")
    Space.new(space_id: result[0]['space_id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
  end

  def self.list
    conn = if ENV['RACK_ENV'] == 'test'
             PG.connect(dbname: 'bnb_test')
           else
             PG.connect(dbname: 'bnb')
           end

    result = conn.exec('SELECT * FROM spaces;')
    result.map do |space|
      Space.new(space_id: result[0]['space_id'], name: space['name'], description: space['description'], price: space['price'])
    end
  end
end
