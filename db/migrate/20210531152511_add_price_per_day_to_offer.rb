class AddPricePerDayToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :price_per_day, :integer
  end
end
