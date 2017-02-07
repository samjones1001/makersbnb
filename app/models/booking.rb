class Booking
  include DataMapper::Resource

  belongs_to :user,           required: true
  belongs_to :space,          required: true
<<<<<<< HEAD
  has n,  :availabledates
=======
  has n, :availabledates

>>>>>>> e34628146f42e5ed4edf001b8c280cb8930644f1

  property :id,               Serial
  property :hired,            Boolean,  required: true
  property :from_date,        Date,     required: true
  property :to_date,          Date,     required: true
  property :created_on,       DateTime, required: true
end
