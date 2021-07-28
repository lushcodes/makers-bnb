# frozen_string_literal: true

def add_test_space
  visit('/add_space')
  fill_in('name', with: 'Lake house')
  fill_in('description', with: 'A lovely house by the water')
  fill_in('price', with: '1000')
  click_button('submit')
end
