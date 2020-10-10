class Organizer < ApplicationRecord
    validates :name, presence: true
    validates :organization_type, inclusion: { in: %w(Commercial Non-Profit Internal) }
    has_and_belongs_to_many :users
    has_many :point_of_contacts
    accepts_nested_attributes_for :point_of_contacts
    has_many :contacts, as: :contactable
    accepts_nested_attributes_for :contacts
    has_one :address, as: :addressable
    accepts_nested_attributes_for :address
    has_many :bookings
    has_many :venues, through: :bookings

    def blank_point_of_contact(attributes)
        attributes[:name].blank?
    end
end
