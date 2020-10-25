class Booking < ApplicationRecord

  validates :name, presence: true
  validates :event_type, presence: true, inclusion: { 
    in: %w(Performance Lecture/Workshop Concert Reception/Fundraiser) 
  }
  validates :date, presence: true, format: { with: /\d\d\d\d\-\d\d\-\d\d/ }
  validates :event_time, presence: true, format: { with: /\d\d\:\d\d\:\d\d/ }
  validates :access_time, presence: true, format: { with: /\d\d\:\d\d\:\d\d/ }
  validates :exit_time, presence: true, format: { with: /\d\d\:\d\d\:\d\d/ }
  validates :attendance, presence: true, numericality: { only_integer: true }
  validates :daily_rate, presence: true, numericality: true

  belongs_to :venue
  belongs_to :organizer
  has_and_belongs_to_many :employees
  has_many_attached :files

  scope :by_organizer, -> (query_id) { 
    joins(:organizer).where( "organizers.id = ?", query_id ) 
  }
  scope :by_event_type, -> (event_type) {
    where( "event_type = ?", event_type )
  }
  scope :current_year, -> { where(date: Date.new(Date.current.year, 1, 1)..Date.new(Date.current.year, 12, 31)) }


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
