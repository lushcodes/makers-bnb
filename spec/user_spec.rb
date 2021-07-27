# frozen_string_literal: true

require 'user'

describe User do
  it 'can be created' do
    clear_test_table
    new_user = User.create(username: 'Luke', email: 'lukerocks@party.io', password: 'Flumpy')
    expect(new_user).to be_a(User)
  end

  it 'can be logged in' do
    clear_test_table
    user = User.create(username: 'Luke', email: 'lukerocks@party.io', password: 'Flumpy')
    logged_in_user = User.authenticate(email: 'lukerocks@party.io', password: 'Flumpy')
    expect(logged_in_user).to eq(true)
  end
end
