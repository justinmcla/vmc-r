class PointOfContact < ApplicationRecord
  
  validates :name, presence: true

  belongs_to :organizer
  has_many :contacts, as: :contactable, dependent: :destroy

  accepts_nested_attributes_for :contacts

end
