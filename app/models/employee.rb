class Employee < ApplicationRecord

  validates :name, presence: true
  validates :start_date, presence: true
  validates :rate, presence: true, numericality: true

  belongs_to :user
  has_and_belongs_to_many :bookings

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  
end
