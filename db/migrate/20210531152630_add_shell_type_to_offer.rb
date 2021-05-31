class AddShellTypeToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :shell_type, :string
  end
end
