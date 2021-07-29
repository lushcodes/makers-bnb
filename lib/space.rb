# frozen_string_literal: true

require 'pg'
require './app'
require_relative 'user'

class Space
  attr_reader :name, :description, :price, :space_id, :user_id

  # user_id:, available? to be added
  def initialize(space_id:, name:, description:, price:, user_id:)
    @user_id = user_id
    @space_id = space_id
    @name = name
    @description = description
    @price = price
  end

  def self.create(name:, description:, price:, user_id:)
    conn = if ENV['RACK_ENV'] == 'test'
             PG.connect(dbname: 'bnb_test')
           else
             PG.connect(dbname: 'bnb')
           end

    result = conn.exec("INSERT INTO spaces (name, description, price, owner_user_id)
    VALUES('#{name}', '#{description}', '#{price}', '#{user_id}') RETURNING owner_user_id, space_id, name, description, price;")
    Space.new(space_id: result[0]['space_id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], user_id: result[0]['owner_user_id'])
  end

  def self.find_space(id:)
    conn = if ENV['RACK_ENV'] == 'test'
        PG.connect(dbname: 'bnb_test')
      else
        PG.connect(dbname: 'bnb')
      end
    result = conn.exec("SELECT * FROM spaces WHERE space_id = '#{id}';")
    Space.new(space_id: result[0]['space_id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], user_id: result[0]['owner_user_id'])
  end

  def self.list
    conn = if ENV['RACK_ENV'] == 'test'
             PG.connect(dbname: 'bnb_test')
           else
             PG.connect(dbname: 'bnb')
           end

    result = conn.exec('SELECT * FROM spaces;')
    result.map do |space|
      Space.new(space_id: result[0]['space_id'], name: space['name'], description: space['description'], price: space['price'], user_id: result[0]['owner_user_id'])
    end
  end
end
