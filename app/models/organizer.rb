class Organizer < ApplicationRecord
    validates :name, presence: true
    has_and_belongs_to_many :users
    has_one :address, as: :addressable
    accepts_nested_attributes_for :address, reject_if: :blank_address
end
