class Offer < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :shell_type, presence: true
  validates :start_available_time, presence: true
  validates :end_available_time, presence: true
  validates :location_address, presence: true
  validates :description, presence: true, length: { minimum: 120 }
  validates :offer_title, presence: true

  geocoded_by :location_address
  after_validation :geocode, if: :will_save_change_to_location_address?
end
