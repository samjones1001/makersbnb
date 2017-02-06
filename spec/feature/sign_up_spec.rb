
require 'spec_helper'

feature 'User sign up' do

	scenario 'visit page' do
		visit '/users/new'
		expect(page).to have_content('Please sign up for a MakersBnB account')
	end

	scenario 'sign up with correct details' do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(User.first.email).to eq 'test@email.com'
	end

	scenario 'Will not accept mismatched passwords' do

      expect { sign_up(password_confirm: 'rubbish') }.not_to change(User,:count)
      expect(current_path).to eq('/users')
      expect(page).to have_content 'Password does not match the confirmation'

  end

end
