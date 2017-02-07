
 feature 'User search' do

   scenario 'As a user i want search for a space' do
     visit '/'
     fill_in :start_date, with: Date
     fill_in :end_date, with: Date 
     click_button 'Show Spaces'
     expect(page).to have_content('Available Spaces')
   end

 end
