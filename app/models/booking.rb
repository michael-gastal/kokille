class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :arrival_date, :end_date, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }
end
