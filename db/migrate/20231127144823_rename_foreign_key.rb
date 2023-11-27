class RenameForeignKey < ActiveRecord::Migration[7.1]
  def change
    rename_column :votes, :answer_id, :proposal_id
  end
end
