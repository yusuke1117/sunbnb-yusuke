class Room < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :gest_count, presence: true
  validates :bedroom_count, presence: true
  validates :bathroom_count, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  
end
