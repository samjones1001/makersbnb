
require 'spec_helper'

feature 'User sign up' do

  context 'is allowed with' do
  
    scenario 'valid details' do
	  expect{ sign_up }.to change(User, :count).by(1)
	  expect(User.first.email).to eq 'test@email.com'
	  expect(page).to have_content('Welcome to MakersBnB, username')
    end

  end

  context 'is not allowed with' do

  	scenario 'mismatched passwords' do
      expect { sign_up(password_confirmation: 'rubbish') }.not_to change(User,:count)
      expect(current_path).to eq('/users')
      expect(page).to have_content 'Password does not match the confirmation'
    end

  	scenario 'a blank email address' do
  	  expect { sign_up(email: nil) }.not_to change(User,:count)
  	  expect(current_path).to eq('/users')
  	  expect(page).to have_content('Email must not be blank')
  	end

  	scenario 'an invalid email address' do
  	  expect { sign_up(email: 'abc') }.not_to change(User,:count)
  	  expect(current_path).to eq('/users')
  	  expect(page).to have_content('Email has an invalid format')
    end

    scenario 'a duplicate email address or username' do
  	  sign_up
  	  expect {sign_up }.not_to change(User, :count)
  	  expect(current_path).to eq('/users')
  	  expect(page).to have_content('Email is already taken')
  	  expect(page).to have_content('Username is already taken')
    end

    scenario 'a blank name' do
  	  expect { sign_up(name: nil) }.not_to change(User,:count)
  	  expect(current_path).to eq('/users')
  	  expect(page).to have_content('Name must not be blank')
    end

    scenario 'a blank user name' do
  	  expect { sign_up(username: nil) }.not_to change(User,:count)
  	  expect(current_path).to eq('/users')
  	  expect(page).to have_content('Username must not be blank')
    end

  end  

end
