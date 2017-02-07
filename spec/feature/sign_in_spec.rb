feature 'sign in' do

	let!(:user) do
		User.create(name: 'Joe Bloggs',
					email: 'test@test.com',
					username: 'username',
					password: 'password',
					password_confirmation: 'password')
	end
	
	context 'is allowed with' do

		scenario 'valid details' do
			sign_in(email: user.email, password: user.password)
			expect(page).to have_content 'Welcome to MakersBnB, username'
		end

	end

	context 'is not allowed with' do

		scenario 'invalid details' do
			sign_in(email: user.email, password: 'nonsense')
			expect(current_path).to eq('/sessions')
			expect(page).to have_content 'The email or password is incorrect'
		end

		scenario 'missing details' do
			sign_in(email: user.email, password: nil)
			expect(current_path).to eq('/sessions')
			expect(page).to have_content 'The email or password is incorrect'
		end

	end

end


