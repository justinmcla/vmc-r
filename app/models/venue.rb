class Venue < ApplicationRecord
    validates :name, presence: true
    validates :seats, presence: true
    validates :configuration, presence: true
    validates :greenrooms, presence: true
    validates :dressing_rooms, presence: true
    belongs_to :user
    has_one :address, as: :addressable, dependent: :destroy
    accepts_nested_attributes_for :address
    def address_attributes=(address_attributes)
        address = Address.find_by_id(address_attributes[:id])
        if address
            address.update(address_attributes)
        else
            address = Address.create(address_attributes)
            self.address = address
        end 
    end
end
