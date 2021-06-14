class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_attendees, foreign_key: :event_attendee_id, dependent: :delete_all
  has_many :attended_event, through: :event_attendees
  has_many :created_events, foreign_key: 'user_id', class_name: 'Event', dependent: :delete_all
end
