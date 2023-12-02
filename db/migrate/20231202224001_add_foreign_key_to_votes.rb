class AddForeignKeyToVotes < ActiveRecord::Migration[7.1]
  def change
    add_reference :votes, :game, foreign_key: true
  end
end
