# frozen_string_literal: true

feature 'Website has button to book space' do
  scenario 'User can navigate to the listings page to book' do
    visit('/')
    click_link 'Book A Space'
    expect(current_path).to eq('/allspaces')
  end

  scenario 'User can book a space on listings page' do
    add_test_space
    click_button('Book')
    expect(page).to have_content 'You have booked the Lake house'
  end
end
