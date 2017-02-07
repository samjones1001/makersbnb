class AvailableDate
  include DataMapper::Resource
  
  belongs_to :booking,        required: true
  belongs_to :space,          required: true

  property :id,               Serial
  property :date,             Date,     required: true
  property :available,        Boolean,  required: true
end
