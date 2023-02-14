class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendance, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendance
  has_many :events, inverse_of: 'creator'
end
