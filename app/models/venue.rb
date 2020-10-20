class Venue < ApplicationRecord

  before_create :set_slug

  validates :name, presence: true
  validates :seats, presence: true, numericality: { 
    only_integer: true 
  }
  validates :configuration, presence: true, inclusion: { 
    in: ['Proscenium', 'Arena', 'Thrust', 'Black Box', 'Flexible', 'Studio'] 
  }
  validates :greenrooms, presence: true, numericality: { 
    only_integer: true 
  }
  validates :dressing_rooms, presence: true, numericality: {
    only_integer: true 
  }
  validate :image_check

  belongs_to :user
  has_one :address, as: :addressable, dependent: :destroy
  has_many :bookings
  has_many :organizers, through: :bookings
  has_many :inventories
  has_many_attached :images

  accepts_nested_attributes_for :address

  scope :by_configuration, -> (configuration) {
    where("configuration LIKE ?", "#{configuration}") 
  }

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

  def image_check

    images.each do |image|
      errors[:images] << 'should be less than 1 MB' if image.byte_size > 1.megabytes
    end

  end
  
end
