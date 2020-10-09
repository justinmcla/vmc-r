class Employee < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :bookings
end
