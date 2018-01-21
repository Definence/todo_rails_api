class AddConfirmedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :confirmed, :boolean, default: false
  end
end
