class Venue < ApplicationRecord
    validates :name, presence: true
    validates :seats, presence: true
    validates :configuration, presence: true
    validates :greenrooms, presence: true
    validates :dressing_rooms, presence: true
    belongs_to :user
    has_one :address, as: :addressable, dependent: :destroy
    accepts_nested_attributes_for :address, reject_if: :blank_address
end
