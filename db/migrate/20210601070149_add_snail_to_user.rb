class AddSnailToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :snail, :boolean, default: false
  end
end
