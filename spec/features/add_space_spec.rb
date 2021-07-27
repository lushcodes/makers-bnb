# frozen_string_literal: true

feature 'Website has a databse of spaces' do
  scenario 'User can add a space to the database' do
    visit('/add_space')
    fill_in('name', with: 'Lake house')
    fill_in('description', with: 'A lovely house by the water')
    fill_in('price', with: '1000') # ppn (price per night)
    click_button('submit')
    expect(page).to have_content('Lake house')
    expect(page).to have_content('A lovely house by the water')
    expect(page).to have_content('1000')
  end
end
