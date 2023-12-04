class AddNumberOfPlayersToGame < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :number_of_players, :integer, default: 0
  end
end


