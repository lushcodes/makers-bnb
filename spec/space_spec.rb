require 'space'

describe Space do
  describe '.create' do
    it 'Allows a user to list a new space' do
      Space.create(name: 'Arthurs retreat',
                   description: 'A beautiful lakeside house, with a view of a legendary sword',
                   price: '10,000')
    end
  end

  describe '.list' do
    it 'displays all spaces' do
      Space.create(name: 'Arthurs retreat',
                   description: 'A beautiful lakeside house, with a view of a legendary sword',
                   price: '10,000')

      spaces = Space.list
      p spaces
      expect(spaces.first.name).to eq 'Arthurs retreat'
      expect(spaces.first.description).to eq 'A beautiful lakeside house, with a view of a legendary sword'
      expect(spaces.first.price).to eq '10,000'
    end
  end
end
