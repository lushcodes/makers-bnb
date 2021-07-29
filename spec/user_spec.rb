# frozen_string_literal: true

require 'user'
describe User do
  before(:each) do
    clean_table
  end

  it 'can be created' do
    user = create_user
    expect(user).to be_a(User)
  end

  it 'cannot be created if user already exists' do
    create_user
    dupe = create_user
    expect(dupe).to eq nil
  end

  it 'can be logged in' do
    create_user
    logged_in_user = User.authenticate(email: 'lukerocks@party.io', password: 'Flumpy')
    expect(logged_in_user).to eq(true)
  end
end
