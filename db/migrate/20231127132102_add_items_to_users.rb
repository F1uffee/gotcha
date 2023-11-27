class AddItemsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :score, :integer, default: 0, null: false
  end
end
