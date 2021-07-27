feature 'Website has button to book space' do
    scenario 'User can book a space' do
        visit("/add_space")
        fill_in('name', with: 'Lake house')
        fill_in('description', with: 'A lovely house by the water')
        fill_in('price', with: '1000') # ppn (price per night)
        click_button("submit")
        visit("/listings")
        click_button("book")
        expect(page).to eq "You have booked this space"
    end
end
