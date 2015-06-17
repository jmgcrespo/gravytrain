class Provider < ActiveRecord::Base
  validates_acceptance_of :terms_and_conditions, allow_nil: false
  validates :name, :address, :postcode, presence: true
  validates :email, format: { with: /@/ }
  validates :email, uniqueness: true
end
