class AddProposalsQuantityToGame < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :proposals_quantity, :integer, default: 0
  end
end
