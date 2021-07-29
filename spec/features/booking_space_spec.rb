# frozen_string_literal: true

feature 'Website has button to book space' do
    scenario 'cannot book space if not logged in' do
      user = User.create(username: 'TEST', email: 'saveme@example.com', password: 'Flumpy')
      Space.create(name: 'Arthurs retreat',
                   description: 'A beautiful lakeside house, with a view of a legendary sword',
                   price: '10,000',
                   user_id: user.id)
      visit('/')
      click_link 'Book A Space'
      expect(current_path).to eq '/allspaces'
      click_button 'Book'
      expect(current_path).to eq '/sign-up'
    end

  scenario 'User can book a space on listings page' do
    user_sign_up
    add_test_space
    click_button('Book')
    expect(page).to have_content 'You have booked the Lake house'
  end
end
