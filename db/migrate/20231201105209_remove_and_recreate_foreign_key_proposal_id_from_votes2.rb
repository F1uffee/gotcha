class RemoveAndRecreateForeignKeyProposalIdFromVotes2 < ActiveRecord::Migration[7.1]
  def change
    remove_reference :votes, :proposal
    add_reference :votes, :proposal, foreign_key: true, null: true
  end
end
