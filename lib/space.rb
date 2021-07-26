require 'pg'
require './app'

class Space
  
  def self.create(name:, description:, price:)
    conn = PG.connect(dbname: 'space')
    conn.exec("INSERT INTO listings (name, description, price) 
    VALUES('#{name}', '#{description}', '#{price}')")
  end
end
