feature 'Sign up' do
  scenario 'checks route and form exists' do
    visit('/')
    expect(page).to have_button('Sign Up')
    click_button 'Sign Up'
    expect(page).to have_field('Username', type: 'text', placeholder: 'Username')
    expect(page).to have_field('Email', type: 'email', placeholder: 'Email')
    expect(page).to have_field('Password', type: 'password', placeholder: 'Password')
    expect(page).to have_button('Submit')
  end

  scenario 'User can sign up' do
    visit('/')
    click_button 'Sign Up'
    fill_in 'username', with: 'Luke'
    fill_in 'email', with: 'lukerocks@party.io'
    fill_in 'password', with: 'Flumpy'
    click_button 'Submit'
    expect(current_path).to eq '/'
    expect(page).to have_content 'You are signed in.'
  end

  scenario 'cannot sign up if user already exist' do
    populate_test_table
    visit('/')
    click_button 'Sign Up'
    fill_in 'username', with: 'Luke'
    fill_in 'email', with: 'lukerocks@party.io'
    fill_in 'password', with: 'Flumpy'
    click_button 'Submit'
    expect(current_path).to eq '/user/new'
  end
end
