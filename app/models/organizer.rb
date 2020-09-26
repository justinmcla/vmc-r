class Organizer < ApplicationRecord
    validates :name, presence: true
    has_and_belongs_to_many :users
    has_many :point_of_contacts
    accepts_nested_attributes_for :point_of_contacts, reject_if: :blank_point_of_contact
    has_many :contacts, as: :contactable
    accepts_nested_attributes_for :contacts
    has_one :address, as: :addressable
    accepts_nested_attributes_for :address, reject_if: :blank_address

    def blank_point_of_contact(attributes)
        attributes[:name].blank?
    end
end
