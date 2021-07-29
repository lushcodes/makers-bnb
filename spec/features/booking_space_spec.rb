# frozen_string_literal: true

feature 'Website has button to book space' do
    scenario 'cannot book space if not logged in' do
      add_test_space
      visit('/')
      click_link 'Book A Space'
      expect(current_path).to eq '/allspaces'
      click_button 'Book'
      expect(current_path).to eq '/sign-up'
    end

<<<<<<< HEAD
  scenario 'User can book a space on listings page' do
    user_sign_up
=======
  scenario 'User can book a space on listings page if logged in' do
    visit('/')
    click_button 'Sign Up'
    fill_in 'username', with: 'lukerox'    
    fill_in 'email', with: 'lukerocks@party.io'
    fill_in 'password', with: 'Flumpy'
    click_button 'Submit'
>>>>>>> main
    add_test_space
    click_button('Book')
    expect(page).to have_content 'You have booked the Lake house'
  end
end
