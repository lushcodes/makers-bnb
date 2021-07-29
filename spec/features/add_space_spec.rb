# frozen_string_literal: true

feature 'Add a space' do
  scenario 'User can add a space to the database' do
    add_test_space
    expect(page).to have_content('Lake house')
    expect(page).to have_content('A lovely house by the water')
    expect(page).to have_content('1000')
  end

  scenario 'user can navigate to the add space page' do
    visit('/')
    click_link 'Add A Space'
    expect(current_path).to eq '/space/new'
  end
end
