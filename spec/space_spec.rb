require 'space'

describe Space do

  describe '.create' do
    it 'Allows a user to list a new space' do
      Space.create(name: 'Arthurs retreat', 
        description: 'A beautiful lakeside house, with a view of a legendary sword', 
        price: '10,000')
    end
  end
end
