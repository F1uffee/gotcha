class AddDefaultStatusToGame < ActiveRecord::Migration[7.1]
  def change
    change_column :games, :status, :string, default: "pending"
  end
end
