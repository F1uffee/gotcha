class RemoveForeignKeyToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :users, :avatars
  end
end
