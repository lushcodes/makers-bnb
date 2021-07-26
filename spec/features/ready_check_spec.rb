feature 'Ready' do
  scenario 'tests if environment is ready' do
    visit('/')
    expect(page).to have_content("READY AND WORKING")
  end
end