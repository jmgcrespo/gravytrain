class Provider < ActiveRecord::Base

  has_many :events
  
  validates_acceptance_of :terms_and_conditions, allow_nil: false, on: :create
  validates :name, :address, :postcode, presence: true
  validates :email, format: { with: /@/ }
  validates_uniqueness_of :email

end
