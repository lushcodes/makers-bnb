# frozen_string_literal: true
def user_sign_up
  visit('/')
  click_button('Sign Up')
  fill_in 'username', with: 'Luke'
  fill_in 'email', with: 'lukerocks@party.io'
  fill_in 'password', with: 'Flumpy'
  click_button 'Submit'
end

def add_test_space
  visit('/space/new')
  fill_in('name', with: 'Lake house')
  fill_in('description', with: 'A lovely house by the water')
  fill_in('price', with: '1000')
  click_button('submit')
end
