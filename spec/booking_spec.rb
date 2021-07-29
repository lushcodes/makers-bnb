require 'booking'

describe Booking do
  describe 'Save booking' do
    it 'Saves a booking to a database' do
      clean_table
      user = User.create(username: 'TEST', email: 'saveme@example.com', password: 'Flumpy')
      space =  Space.create(name: 'Arthurs retreat',
        description: 'A beautiful lakeside house, with a view of a legendary sword',
        price: '10,000',
        user_id: user.id)
      newbook = Booking.create(id: space.space_id)
      expect(newbook).to be_a(Booking)
      expect(newbook.name).to eq('Arthurs retreat')
      expect(newbook.description).to eq('A beautiful lakeside house, with a view of a legendary sword')
      expect(newbook.price).to eq('10,000') 
    end
  end
end
