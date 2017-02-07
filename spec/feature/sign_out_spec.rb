feature 'sign out' do
	
	before(:each) do
		User.create(name: 'Joe Bloggs',
					email: 'test@test.com',
					username: 'username',
					password: 'password',
					password_confirmation: 'password')
	end

	scenario 'after signing in' do
		sign_in(email: 'test@test.com', password: 'password')
		click_button 'Sign Out!'
		expect(page).not_to have_content 'Welcome to MakersBnB, username'
	end

end