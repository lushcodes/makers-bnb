<<<<<<< HEAD
require 'pg'

def populate_user_test_table
=======
def populate_test_table
>>>>>>> main
  User.create(username: 'Luke', email: 'lukerocks@party.io', password: 'Flumpy')
  User.create(username: 'Else', email: 'else@party.io', password: 'Dreams')
  User.create(username: 'Example', email: 'example@party.io', password: 'EXAMPLE')
end

def create_user
  User.create(username: 'Luke', email: 'lukerocks@party.io', password: 'Flumpy')
end

def clean_table
  conn = PG.connect(dbname: 'bnb_test')
  conn.exec('TRUNCATE TABLE users, spaces, bookings;')
end
