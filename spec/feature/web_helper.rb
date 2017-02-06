def sign_up
	visit '/users/new'
    fill_in 'name', with: "Joe Bloggs"
    fill_in 'email', with: "test@email.com"
    fill_in 'username', with: "username"
    fill_in 'password', with: 'password'
    #fill_in 'password_confirm', with: 'password'
    click_button 'Sign Up!'
end
