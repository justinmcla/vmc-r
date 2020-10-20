class Booking < ApplicationRecord

  validates :name, presence: true
  validates :event_type, presence: true, inclusion: { 
    in: %w(Performance Lecture/Workshop Concert Reception/Fundraiser) 
  }
  validates :date, presence: true, format: { 
    with: /\d\d\d\d\-\d\d\-\d\d/ 
  }
  validates :event_time, presence: true, format: { 
    with: /\d\d\:\d\d\:\d\d/ 
  }
  validates :access_time, presence: true, format: { 
    with: /\d\d\:\d\d\:\d\d/ 
  }
  validates :exit_time, presence: true, format: { 
    with: /\d\d\:\d\d\:\d\d/ 
  }
  validates :attendance, presence: true, numericality: { 
    only_integer: true 
  }
  validates :daily_rate, presence: true, numericality: true

  belongs_to :venue
  belongs_to :organizer
  has_and_belongs_to_many :employees

  scope :by_organizer, -> (organizer) { 
    joins(:organizer).where( "organizers.name LIKE ?", "%#{organizer}%" ) 
  }

end
