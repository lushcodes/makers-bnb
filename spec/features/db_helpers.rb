require 'pg'

def populate_user_test_table
  User.create(username: 'Luke', email: 'lukerocks@party.io', password: 'Flumpy')
  User.create(username: 'Else', email: 'else@party.io', password: 'Dreams')
  User.create(username: 'Example', email: 'example@party.io', password: 'EXAMPLE')
end

def create_user
  User.create(username: 'Luke', email: 'lukerocks@party.io', password: 'Flumpy')
end

def clean_table
  conn = PG.connect(dbname: 'bnb_test')
  conn.exec('TRUNCATE TABLE users CASCADE;')
  conn.exec('TRUNCATE TABLE spaces CASCADE;')
  conn.exec('TRUNCATE TABLE bookings;')
end
