class AddPriceCapacityToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :capacity, :integer
  end
end
