
 feature 'User search' do

   scenario 'As a user i want search for a space' do
     visit '/'
     fill_in :start_date, with: "01/01/2000"
     fill_in :end_date, with: "01/01/2000"
     click_button 'Show Spaces'
     expect(page).to have_content('Available Spaces')
     expect(page).to have_content("01-01-2000 to 01-01-2000")
   end

 end
