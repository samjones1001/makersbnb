def new_listing(name="Home", description="Amazing place", price_per_night=4.50, available_from="01/01/2017", available_to="05/01/2017")

  visit('/spaces/new')
  fill_in('name', with: name)
  fill_in('description', with: description)
  fill_in('price_per_night', with: price_per_night)
  fill_in('available_from', with: available_from)
  fill_in('available_to', with: available_to)
  click_button('List my Space')

end

def sign_up(name: 'Joe Bloggs',
        username: 'username',
        email: 'test@email.com',
            password: '12345678',
            password_confirmation: '12345678')
  visit '/users/new'
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up!'
end



def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign In!'
end
