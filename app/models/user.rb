require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirm

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  has n, :bookings
  has n, :spaces

  property :id,               Serial
  property :name,             String, required: true
  property :username,         String, required: true, unique: true
  property :email,            String, required: true, unique: true
  property :password_digest,  Text,   required: true


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
