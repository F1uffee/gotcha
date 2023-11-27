class RenameAnswersToProposals < ActiveRecord::Migration[7.1]
  def change
    rename_table :answers, :proposals
  end 
end
