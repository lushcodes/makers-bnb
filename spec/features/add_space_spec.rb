# frozen_string_literal: true

feature 'Add a space' do
  scenario 'User can add a space to the database' do
    user_sign_up
    add_test_space
    expect(page).to have_content('Lake house')
    expect(page).to have_content('A lovely house by the water')
    expect(page).to have_content('1000')
  end

  scenario 'can only add space when user logged in' do
    populate_test_table
    visit('/')
    click_button 'Log In'
    fill_in 'email', with: 'lukerocks@party.io'
    fill_in 'password', with: 'Flumpy'
    click_button 'Submit'
    click_link 'Add A Space'
    expect(current_path).to eq '/space/new'
  end

  scenario 'cannot add space if not logged in' do
    visit('/')
    click_link 'Add A Space'
    expect(current_path).to eq '/user/new'
  end
end
