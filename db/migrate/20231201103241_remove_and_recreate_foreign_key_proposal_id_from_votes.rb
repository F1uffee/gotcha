class RemoveAndRecreateForeignKeyProposalIdFromVotes < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :votes, :proposals
    add_foreign_key :votes, :proposals, null: true
  end
end
