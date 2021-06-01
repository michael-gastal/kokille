class AddStartAvailableTimeToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :start_available_time, :date
  end
end
