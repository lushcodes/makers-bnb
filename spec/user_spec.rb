# frozen_string_literal: true

require 'user'

describe User do
  it 'user can be created' do
    new_user = User.create(username: 'Luke', email: 'lukerocks@party.io', password: 'Flumpy')
    expect(new_user).to be_a(User)
  end
end
