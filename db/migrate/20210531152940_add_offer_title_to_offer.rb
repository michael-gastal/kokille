class AddOfferTitleToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :offer_title, :string
  end
end
