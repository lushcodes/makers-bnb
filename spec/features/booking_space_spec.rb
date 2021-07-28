# frozen_string_literal: true

feature 'Website has button to book space' do
  scenario 'User can book a space' do
    add_test_space
    click_button('Book')
    expect(page).to have_content 'You have booked the Lake House'
  end
end
