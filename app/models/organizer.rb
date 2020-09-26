class Organizer < ApplicationRecord
    validates :name, presence: true
    has_and_belongs_to_many :users
    has_one :address, as: :addressable
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
