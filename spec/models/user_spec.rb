describe 'User' do
	
	let!(:user) do
		User.create(name: 'Joe Bloggs',
					email: 'test@test.com',
					username: 'username',
					password: 'password',
					password_confirmation: 'password')
	end

	it 'can be authenticated with valid details' do
		authenticated_user = User.authenticate(user.email, user.password)
		expect(authenticated_user).to eq user
	end

	it 'can not be authenticated with invalid details' do
		authenticated_user = User.authenticate(user.email, 'nonsense')
		expect(authenticated_user).to be_nil
	end

end