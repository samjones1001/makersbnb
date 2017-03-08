## MakersBnB
#### Technologies: Ruby, JavaScript, jQuery, Sinatra, PostgreSQL, DataMapper, RSpec, Capybara 
### Week 6 group project for [Makers Academy] (http://www.makersacademy.com)
[Team Members](#team-members) | [Outline](#outline) | [Database Schema](#database-schema) | [Screenshots](#screenshots) | [User Stories](#user-stories) | [Gems](#gems) | [Usage Instructions](#usage-instructions) | [Heroku](https://makersbestbnb.herokuapp.com/)

## Brief
We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.
Headline specifications

 * Any signed-up user can list a new space.
 * Users can list multiple spaces.
 * Users should be able to name their space, provide a short description of the space, and a price per night.
 * Users should be able to offer a range of dates where their space is available.
 * Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
 * Nights for which a space has already been booked should not be available for users to book that space.
 * Until a user has confirmed a booking request, that space can still be booked for that night.

## Team Members
* [Adrian Eyre] (https://github.com/adrianeyre)
* [Sam Jones] (https://github.com/samjones1001)
* [Basile Koko] (https://github.com/BasileKoko)
* [Justin Butwell] (https://github.com/Justinio14)
* [Paul Goodman] (https://github.com/thegooders)

## Outline
This application - a lightweight AirBnB clone - was built as a one week group project.  After a short planning session session on the first day, we split into pairs or small groups and worked independently on different areas of the application.  We used [Waffle.io](https://waffle.io/) to keep track of GitHub issues and tried to simulate a real world development workflow - a pair would submit the code they had worked on, then another pair would conduct a code review and ship it to production.

As a group, we worked according to Agile methodologies, holding daily stand ups and retros, and tried to adhere to [XP values](http://www.extremeprogramming.org/values.html).

## Database Schema
[![DatabaseSchema](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/DatabaseSchema.png)](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/DatabaseSchema.png "Database Chema")

## Screenshots
### Main Screen
[![ScreenShot1](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/screenshot1.png)](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/screenshot1.png "Screen Shot 1")
### Sign Up Screen
[![ScreenShot2](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/screenshot2.png)](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/screenshot2.png "Screen Shot 2")
### Request Space
[![ScreenShot3](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/screenshot3.png)](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/screenshot3.png "Screen Shot 3")
### List Space
[![ScreenShot4](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/screenshot4.png)](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/screenshot4.png "Screen Shot 4")
### Dashboard
[![ScreenShot5](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/screenshot5.png)](https://raw.githubusercontent.com/samjones1001/makersbnb/master/images/screenshot5.png "Screen Shot 5")

## User Stories
```
As a user
So that I can use MakersBnB
I want to be able to sign up

As a user
So that I can use MakersBnB
I want to be able to sign in

As a property owner
So that I can hire spaces to other users
I want to list one or more spaces

As a property owner
So I can attract interest in my space
I want to add details about the space (dates, description, price, name)

As a property owner
So that other users can hire my space
I want to confirm a hire request

As a renter
So that I can find a space to stay
I want to make a hire request 

As a user
So that I can view available spaces
Only spaces with available dates should be displayed

As a property owner
So that I can manage hire requests
I want a posting to remain available until I confirm a hire request 
```

## Gems
```ruby
gem 'sinatra'
gem 'sinatra-flash'
gem 'data_mapper'
gem 'dm-postgres-adapter'
gem 'rake'

group :test do
  gem 'byebug'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'rspec'
  gem 'rspec-sinatra'
  gem 'selenium-webdriver'
end
```

## Usage Instructions
* clone the repo and run bundle
```shell
$ git clone https://github.com/samjones1001/makersbnb
$ cd makersbnb
$ rvm 2.3.3
$ bundle
```
* run tests
```shell
$ rspec
```
* start up sinatra
```shell
$ ruby app.rb
```
* in your browser, navigate to http://localhost:4567/ 
