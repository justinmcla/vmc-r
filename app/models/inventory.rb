class Inventory < ApplicationRecord
    validates :name, presence: true
    belongs_to :venue
    has_many :items
end
