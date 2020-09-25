class Venue < ApplicationRecord
    validates :name, presence: true
    validates :seats, presence: true
    validates :configuration, presence: true
    validates :greenrooms, presence: true
    validates :dressing_rooms, presence: true
    belongs_to :user
    has_many :addresses, as: :addressable
    accepts_nested_attributes_for :addresses
    def addresses_attributes=(address_attributes)
        address_attributes.values.each do |address_attribute|
          address = Address.find_or_create_by(address_attribute)
          self.addresses << address
        end
      end
end
