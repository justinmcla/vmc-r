class Venue < ApplicationRecord
    before_create :set_slug
    validates :name, presence: true
    validates :seats, presence: true, numericality: { only_integer: true }
    validates :configuration, presence: true, inclusion: { in: ['Proscenium', 'Arena', 'Thrust', 'Black Box', 'Flexible', 'Studio'] }
    validates :greenrooms, presence: true, numericality: { only_integer: true }
    validates :dressing_rooms, presence: true, numericality: { only_integer: true }
    belongs_to :user
    has_one :address, as: :addressable, dependent: :destroy
    accepts_nested_attributes_for :address, reject_if: :blank_address
    has_many :bookings
    has_many :organizers, through: :bookings
    has_many :inventories

    def to_param
        slug
    end

    private

    def set_slug
        slugged = self.name.downcase.split.join('-')
        self.slug = slugged
        counter = 1
        loop do
            break unless Venue.where(slug: slug).exists?
            self.slug = slugged + counter.to_s
            counter += 1
        end
    end
end
