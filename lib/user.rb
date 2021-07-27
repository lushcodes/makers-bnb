# frozen_string_literal: true

require 'pg'

class User
  attr_reader :username, :email, :password

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
end
