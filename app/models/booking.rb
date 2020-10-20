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
  scope :by_event_type, -> (event_type) {
    where( "event_type LIKE ?", "%#{event_type}%")
  }
  scope :recurring,     -> { where(recurring: true) }
  scope :catering,      -> { where(catering: true) }
  scope :alcohol,       -> { where(alcohol: true) }
  scope :lighting,      -> { where(lighting: true) }
  scope :spotlight,     -> { where(spotlight: true) }
  scope :sound,         -> { where(sound: true) }
  scope :microphones,   -> { where(microphones: true) }
  scope :security,      -> { where(security: true) }
  scope :road_closure,  -> { where(road_closure: true) }
  scope :contract,      -> { where(contract: true) }
  scope :deposit,       -> { where(deposit: true) }
  scope :paid,          -> { where(paid: true) } 

  def contract_value
    contract_value = self.daily_rate
    self.employees.each do |employee|
      contract_value += employee.rate * self.time_value
    end
    contract_value
  end

  def time_value
    (self.exit_time - self.access_time) / 3600
  end

end
