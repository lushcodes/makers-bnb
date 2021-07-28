def clear_test_table
  con = PG.connect dbname: 'bnb_test'
  con.exec('TRUNCATE TABLE users;')
end

def populate_test_table
  User.create(username: 'Luke', email: 'lukerocks@party.io', password: 'Flumpy')
  User.create(username: 'Else', email: 'else@party.io', password: 'Dreams')
  User.create(username: 'Example', email: 'example@party.io', password: 'EXAMPLE')
end
