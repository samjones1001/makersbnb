feature "Update space" do

before(:each) do
  user1 = User.create(name: 'Joe Bloggs',
        email: 'test@test.com',
        username: 'username',
        password: 'password',
        password_confirmation: 'password')

  user2 = User.create(name: 'Fred Bloggs',
              email: 'test2@test.com',
              username: 'username',
              password: 'password',
              password_confirmation: 'password')

  space1 = Space.create!(name: "Home",
    description: "Amazing place",
    price_per_night: 4.50,
    image: nil,
    user_id: user1.id)

  space2 = Space.create!(name: "Big Home",
      description: "More amazing place",
      price_per_night: 10.50,
      image: nil,
      user_id: user2.id)
end

  context "when logged in" do

    scenario 'user1 cannot edit user2 listed spaces' do

      sign_in(email: 'test@test.com', password: 'password')
      visit('/spaces/edit')
      within('ul#myspaces li:nth-child(1)') do
        expect(page).to_not have_content("Big Home")
        expect(page).to_not have_content("More amazing place")
        expect(page).to_not have_content("£10.50")
      end
    end

    scenario 'user can see a list of his/her listed spaces with a button to update' do

      sign_in(email: 'test@test.com', password: 'password')
      visit('/spaces/edit')

      within('ul#myspaces li:nth-child(1)') do
        expect(page).to have_content("Home")
        expect(page).to have_content("Amazing place")
        expect(page).to have_content("£4.50")
        expect(page).to have_selector("input[type=submit][value='Update my Space']")
      end

    end

    scenario 'user can see a listing update form with existing data pre-populated' do

      sign_in(email: 'test@test.com', password: 'password')
      visit('/spaces/edit')
      within('ul#myspaces li:nth-child(1)') do
        click_button 'Update my Space'
      end

      expect(page).to have_content("Update Listing Form")
      expect(find_field('name').value).to eq('Home')
      expect(find_field('description').value).to eq('Amazing place')
      expect(find_field('price_per_night').value).to eq('£4.50')
    end

    scenario 'user can update name, description and price_per_night' do

      sign_in(email: 'test@test.com', password: 'password')
      visit('/spaces/edit')
      within('ul#myspaces li:nth-child(1)') do
        click_button 'Update my Space'
      end

      fill_in('name', with: "New Home")
      fill_in('description', with: "Another amazing place")
      fill_in('price_per_night', with: "9")
      click_button 'Submit changes'

      expect(page).to have_content("New Home")
      expect(page).to have_content("Another amazing place")
      expect(page).to have_content("£9.00")

    end

  end
end
