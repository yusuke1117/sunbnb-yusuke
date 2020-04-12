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

  has_many :reservations

  has_many :guest_reviews
  
  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
  end

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end
end
