class Booking
  include DataMapper::Resource
  # storage_names[:default] = 'booking'

  belongs_to :user,          required: true
  belongs_to :space,          required: true
  has n, :availabledates

  property :id,               Serial
  property :hired,            Boolean,  required: true
  property :from_date,        Date,     required: true
  property :to_date,          Date,     required: true
  property :created_on,       DateTime, required: true
end
