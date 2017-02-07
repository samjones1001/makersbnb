class Availabledate
  include DataMapper::Resource

  belongs_to :booking,        required: false
  belongs_to :space,          required: true

  property :id,               Serial
  property :date,             Date,     required: true
  property :available,        Boolean,  required: true
end
