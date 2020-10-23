class Contact < ApplicationRecord

  validates :via, presence: true, inclusion: { in: %w(Email Phone) }
  validates :value, presence: true
  
  belongs_to :contactable, polymorphic: true, optional: true

end
