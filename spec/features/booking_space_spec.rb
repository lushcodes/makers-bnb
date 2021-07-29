# frozen_string_literal: true

feature 'Website has button to book space' do
    scenario 'cannot book space if not logged in' do
      clear_test_table
      add_test_space
      visit('/')
      click_link 'Book A Space'
      expect(current_path).to eq '/allspaces'
      click_button 'Book'
      expect(current_path).to eq '/sign-up'
    end

    scenario 'user can book a space if logged in' do
      populate_test_table
      visit('/')
      click_button 'Log In'     
      fill_in 'email', with: 'lukerocks@party.io'
      fill_in 'password', with: 'Flumpy'
      click_button 'Submit'
      click_link 'Book A Space'
      expect(current_path).to eq '/allspaces'
      click_button 'Book'  
      expect(current_path).to eq '/bookings'
    end

  scenario 'User can book a space on listings page if logged in' do
    visit('/')
    click_button 'Log In'     
    fill_in 'email', with: 'lukerocks@party.io'
    fill_in 'password', with: 'Flumpy'
    click_button 'Submit'
    click_link 'Book A Space'
    click_button('Book')
    expect(page).to have_content 'You have booked the Lake house'
  end
end
