class AddEndAvailableTimeToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :end_available_time, :date
  end
end
