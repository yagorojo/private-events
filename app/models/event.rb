class Event < ApplicationRecord
  scope :expired, ->(time) { where('date < ?', time) }
  scope :pending, ->(time) { where('date > ?', time) }

  has_many :attendance, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendance
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
end
