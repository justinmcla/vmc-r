class Item < ApplicationRecord
    validates :name, presence: true
    validates :quantity, presence: true
    belongs_to :inventory
end
