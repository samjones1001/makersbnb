
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

end
