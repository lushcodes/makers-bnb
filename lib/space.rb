require 'pg'
require './app'

class Space
  
  def self.create(name:, description:, price:)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bnb_test')
    else
      conn = PG.connect(dbname: 'bnb')
    end
    
    conn.exec("INSERT INTO listings (name, description, price) 
    VALUES('#{name}', '#{description}', '#{price}')")
  end
end
