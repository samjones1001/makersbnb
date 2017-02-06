
require 'spec_helper'

feature 'User sign up' do
	scenario 'visit page' do
		visit '/users/new'
		expect(page).to have_content('Please sign up for a MakersBnB account')
	end
  
end
