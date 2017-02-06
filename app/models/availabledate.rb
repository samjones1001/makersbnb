class AvailableDate
  include DataMapper::Resource
  # storage_names[:default] = 'availableDate'

  belongs_to :booking,        required: true
  belongs_to :space,          required: true

  property :id,               Serial
  property :date,             Date,     required: true
  property :available,        Boolean,  required: true
end
