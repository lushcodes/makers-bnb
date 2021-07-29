feature 'Log Out' do
  scenario 'user is able to log out after sign up' do
    visit('/')
    click_button 'Sign Up'
    fill_in 'username', with: 'Luke'
    fill_in 'email', with: 'lukerocks@party.io'
    fill_in 'password', with: 'Flumpy'
    click_button 'Submit'
    click_button 'Log Out'
    expect(page).to have_button 'Sign Up'
    expect(page).to have_button 'Log In'
  end

  scenario 'user is able to log out after logging in' do
    populate_test_table
    visit('/')
    click_button 'Log In'
    fill_in 'email', with: 'lukerocks@party.io'
    fill_in 'password', with: 'Flumpy'
    click_button 'Submit'
    expect(current_path).to eq '/'
    expect(page).to have_button 'Log Out'
    click_button 'Log Out'
    expect(page).to have_button 'Sign Up'
    expect(page).to have_button 'Log In'
  end
end