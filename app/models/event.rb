class Event < ApplicationRecord
  has_many :event_attendees, foreign_key: :attended_event_id, dependent: :delete_all
  has_many :attendees, through: :event_attendees, source: :event_attendee
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :event_date, presence: true
  validates :event_name, presence: true

  # scope :past, -> { order(:event_date).where('event_date < ?', Date.today) }
  # scope :upcoming, -> { order(:event_date).where('event_date < ?', Date.today) }
  scope :upcoming_events, -> { order(:event_date).where('event_date >= ?', Time.zone.now) }
  scope :previous_events, -> { order(:event_date).where('event_date < ?', Time.zone.now) }
end
