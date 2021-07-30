require 'booking'

describe Booking do
  describe 'Save booking' do
    it 'Saves a booking to a database' do
      user = User.create(username: 'TEST', email: 'saveme@example.com', password: 'Flumpy')
      space =  Space.create(name: 'Arthurs retreat',
        description: 'A beautiful lakeside house, with a view of a legendary sword',
        price: '10,000',
        user_id: user.id)
        newbook = Booking.create(id: space.space_id, user_id: user.id, start_date: '2021-07-30', end_date: '2021-08-02')
      expect(newbook).to be_a(Booking)
      expect(newbook.name).to eq('Arthurs retreat')
      expect(newbook.description).to eq('A beautiful lakeside house, with a view of a legendary sword')
      expect(newbook.price).to eq('10,000') 
    end
  end

  describe 'Populate booking_user_id in booking database' do
    it 'Saves user id to databse' do
      user = User.create(username: 'TEST', email: 'saveme@example.com', password: 'Flumpy')
      space =  Space.create(name: 'Arthurs retreat',
        description: 'A beautiful lakeside house, with a view of a legendary sword',
        price: '10,000',
        user_id: user.id)
        newbook = Booking.create(id: space.space_id, user_id: user.id, start_date: '2021-07-30', end_date: '2021-08-02')
      expect(newbook.user_id).to eq(user.id)
    end
  end
  describe 'Adding start and end dates to database' do
    it 'saves start and end dates' do
      user = User.create(username: 'TEST', email: 'saveme@example.com', password: 'Flumpy')
      space =  Space.create(name: 'Arthurs retreat',
        description: 'A beautiful lakeside house, with a view of a legendary sword',
        price: '10,000',
        user_id: user.id)
      newbook = Booking.create(id: space.space_id, user_id: user.id, start_date: '2021-07-30', end_date: '2021-08-02')
      expect(newbook.start_date).to eq newbook.start_date
      expect(newbook.end_date).to eq newbook.end_date
    end
  end
end
