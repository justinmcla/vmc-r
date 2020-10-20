class Item < ApplicationRecord

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { 
    only_integer: true 
  }

  belongs_to :inventory
  
end
