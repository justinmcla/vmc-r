class User < ApplicationRecord

  before_create :set_slug

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { 
    with: /.+@.+\..+/ 
  }

  has_and_belongs_to_many :organizers
  has_many :venues
  has_many :bookings, through: :venues
  has_many :tasks
  has_many :employees

  def to_param
    slug
  end

  private

  def set_slug

    loop do
      self.slug = SecureRandom.uuid
      break unless User.where(slug: slug).exists?
    end
    
  end

end
