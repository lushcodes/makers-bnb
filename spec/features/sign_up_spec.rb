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
end