require 'booking'

describe Booking do
  describe 'Save booking' do
    it 'Saves a booking to a database' do
      p Space.create(name: 'hi', description: 'Sunshine', price: '1000')
      newbook = Booking.create(name: 'hi', description: '', price: '')
      expect(newbook).to be_a(Booking)
      expect(newbook.name).to eq('hi')
      expect(newbook.description).to eq('Sunshine')
      expect(newbook.price).to eq('1000') 
    end
  end
end
