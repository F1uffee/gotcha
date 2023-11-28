class RemoveBigIntToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :avatar_id

  end
end
