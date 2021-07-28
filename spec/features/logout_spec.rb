feature 'Log Out' do
  scenario 'user is able to log out after sign up' do
    clear_test_table
    visit('/')
    click_button 'Sign Up'
    fill_in 'username', with: 'Luke'
    fill_in 'email', with: 'lukerocks@party.io'
    fill_in 'password', with: 'Flumpy'
    click_button 'Submit'
    expect(current_path).to eq '/'
    expect(page).to have_button 'Log Out'

  end
end