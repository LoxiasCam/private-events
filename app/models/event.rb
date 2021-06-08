class Event < ApplicationRecord
  has_many :event_attendees, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendees, source: :event_attendee
  belongs_to :creator, class_name: "User", foreign_key: 'user_id'
end
