class AddQuestionIdToVote < ActiveRecord::Migration[7.1]
  def change
    add_reference :votes, :question, foreign_key: true
  end
end
