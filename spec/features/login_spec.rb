feature 'Log In' do
  scenario 'user can log in' do
    populate_test_table
    visit('/')
    expect(page).to have_button('Log In')
    click_button 'Log In'
    fill_in 'email', with: 'lukerocks@party.io'
    fill_in 'password', with: 'Flumpy'
    click_button 'Submit'
    expect(current_path).to eq '/'
    expect(page).to have_content 'You are signed in.'
  end

  scenario 'user cannot log in with incorrect details' do
    visit('/')
    expect(page).to have_button('Log In')
    click_button 'Log In'
    fill_in 'email', with: 'bad_email@example.com'
    fill_in 'password', with: 'WRONG PASSWORD'
    click_button 'Submit'
    expect(current_path).to eq '/session'
  end
end
