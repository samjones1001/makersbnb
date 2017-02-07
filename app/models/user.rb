
require 'bcrypt'

class User
  
  attr_reader 	:password
  attr_accessor	:password_confirmation
  include DataMapper::Resource

  has n, :bookings
  has n, :spaces

  property :id,               Serial
  property :name,             String, required: true
  property :username,         String, required: true, unique: true
  property :email,            String, required: true, unique: true
  property :password_digest,  Text,   required: true

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address
  
  def password=(password)
  	@password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
