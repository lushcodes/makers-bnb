# frozen_string_literal: true

require 'space'
require 'user'

describe Space do
  describe '.create' do
    it 'Allows a user to list a new space' do
      space = Space.create(name: 'Arthurs retreat',
                   description: 'A beautiful lakeside house, with a view of a legendary sword',
                   price: '10,000')
    expect(space.name).to eq 'Arthurs retreat'
    expect(space.description).to eq 'A beautiful lakeside house, with a view of a legendary sword'
    expect(space.price).to eq '10,000'
    end
  end

  describe '.list' do
    it 'displays all spaces' do
      user = User.create(username: 'Luke', email: 'lukerocks@party.io', password: 'Flumpy')
     
      p 'output'
     p user
      p user.id
      Space.create(name: 'Arthurs retreat',
                   description: 'A beautiful lakeside house, with a view of a legendary sword',
                   price: '10,000',
                   user_id: user.id)
      spaces = Space.list
      expect(spaces.first.name).to eq 'Arthurs retreat'
      expect(spaces.first.description).to eq 'A beautiful lakeside house, with a view of a legendary sword'
      expect(spaces.first.price).to eq '10,000'
      expect(spaces.first.owner_user_id).to eq user.id
    end

    describe '.find' do
      it 'can find space' do
        space = Space.create(name: 'Arthurs retreat',
                             description: 'A beautiful lakeside house, with a view of a legendary sword',
                             price: '10,000')

        retrieved = Space.find_space(id: space.space_id)
        expect(retrieved).to be_a Space
        expect(retrieved.name).to eq 'Arthurs retreat'
      end
    end
  end
end
