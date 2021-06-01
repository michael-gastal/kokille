class AddLocationAddressToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :location_address, :text
  end
end
