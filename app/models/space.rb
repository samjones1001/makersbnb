class Space
  include DataMapper::Resource

  has n,     :bookings
  belongs_to :user,          required: true
  has n,     :availabledates

  property :id,               Serial
  property :name,             String, required: true
  property :description,      String
  property :price_per_night,  Float,  required: true
  property :image,            Text
end
