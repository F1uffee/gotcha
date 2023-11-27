class RenameAnswerColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :proposals, :answer, :proposal
  end
end
