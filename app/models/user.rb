class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /.+@.+\..+/ }
    has_and_belongs_to_many :organizers
    has_many :venues
    has_many :bookings, through: :venues
    has_many :tasks
    has_many :employees
end
