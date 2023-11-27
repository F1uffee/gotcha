class Round < ApplicationRecord
  belongs_to :game
  belongs_to :question
  validates :question_id, uniqueness:{scope: :game_id}
end
