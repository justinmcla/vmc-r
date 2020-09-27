class Booking < ApplicationRecord
    validates :name, presence: true
    validates :event_type, presence: true
    validates :date, presence: true
    validates :event_time, presence: true
    validates :access_time, presence: true
    validates :exit_time, presence: true
    validates :attendance, presence: true
    validates :daily_rate, presence: true
    belongs_to :venue
    belongs_to :organizer
end
