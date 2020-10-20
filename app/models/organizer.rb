class Organizer < ApplicationRecord

  validates :name, presence: true
  validates :organization_type, inclusion: { 
    in: %w(Commercial Non-Profit Internal) 
  }

  has_many :bookings
  has_many :venues, through: :bookings
  has_many :point_of_contacts
  has_many :contacts, as: :contactable
  has_one :address, as: :addressable
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :point_of_contacts
  accepts_nested_attributes_for :contacts
  accepts_nested_attributes_for :address

  scope :by_type, -> (organization_type) {
    where("organization_type LIKE ?", "#{organization_type}")
  }

end
