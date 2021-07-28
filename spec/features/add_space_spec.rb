# frozen_string_literal: true

feature 'Website has a databse of spaces' do
  scenario 'User can add a space to the database' do
    add_test_space
    expect(page).to have_content('Lake house')
    expect(page).to have_content('A lovely house by the water')
    expect(page).to have_content('1000')
  end
end
