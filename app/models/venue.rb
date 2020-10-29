class Venue < ApplicationRecord

  before_create :set_slug

  validates :name, presence: true
  validates :seats, presence: true, numericality: { only_integer: true }
  validates :greenrooms, presence: true, numericality: { only_integer: true }
  validates :dressing_rooms, presence: true, numericality: { only_integer: true }
  validates :configuration, presence: true, inclusion: { 
    in: ['Proscenium', 'Arena', 'Thrust', 'Black Box', 'Flexible', 'Studio', 'Outdoor'] 
  }
  validate :image_check

  belongs_to :user
  has_one :address, as: :addressable, dependent: :destroy
  has_many :bookings
  has_many :organizers, through: :bookings
  has_many :inventories
  has_many_attached :images
  has_many_attached :files

  accepts_nested_attributes_for :address

  scope :by_configuration, -> (configuration) {
    where("configuration LIKE ?", "#{configuration}") 
  }

  def to_param
      slug
  end

  def booking_capacity
    '%.2f' % (self.bookings.current_year.count / 365.0 * 100)
  end

  def most_frequent_organizer
    frequencies = self.organizers.inject(Hash.new(0)) { |k, v| k[v] += 1; k }
    self.organizers.max_by { |v| frequencies[v] }
  end

  def most_frequent_organizer_percent
    organizer_bookings = self.bookings.where(organizer: self.most_frequent_organizer).count
    organizer_bookings / self.bookings.count.to_f * 100
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
