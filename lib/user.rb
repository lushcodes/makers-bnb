# frozen_string_literal: true

require 'pg'

class User
  attr_reader :id, :username, :email, :password

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.create(username:, email:, password:)
    con = if ENV['RACK_ENV'] == 'test'
            PG.connect dbname: 'bnb_test'
          else
            PG.connect dbname: 'bnb'
          end
    new_user = con.exec("INSERT INTO users (username, email, password) VALUES ('#{username}', '#{email}', '#{password}') RETURNING id, username, email, password;")
    User.new(id: new_user[0]['id'], username: new_user[0]['username'], email: new_user[0]['email'],
             password: new_user[0]['password'])
  end

  def self.authenticate(email:, password:)
    con = if ENV['RACK_ENV'] == 'test'
      PG.connect dbname: 'bnb_test'
    else
      PG.connect dbname: 'bnb'
    end

    user_data = con.exec("SELECT * FROM users WHERE email = '#{email}' AND password = '#{password}';")
    return unless user_data.any?
    checked_user = User.new(id: user_data[0]['id'], username: user_data[0]['username'], email: user_data[0]['email'], password: user_data[0]['password'])
      if checked_user.id.nil?
        false
      else
        true
      end
  end
end
