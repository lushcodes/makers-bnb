def populate_test_table
  User.create(username: 'Luke', email: 'lukerocks@party.io', password: 'Flumpy')
  User.create(username: 'Else', email: 'else@party.io', password: 'Dreams')
  User.create(username: 'Example', email: 'example@party.io', password: 'EXAMPLE')
end

def create_user
  User.create(username: 'Luke', email: 'lukerocks@party.io', password: 'Flumpy')
end

