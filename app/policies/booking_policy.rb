class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    !user.snail? && @snail != user
  end

  def my_bookings?
    !user.snail? && @snail != user
  end

  # def my_offers?
  #   record.offer_id.user_id == user
  # end
end
