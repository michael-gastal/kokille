class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :arrival_date, :end_date, presence: true
end
