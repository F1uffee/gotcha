class RemoveScoreFromTableUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :score, :integer
  end
end
