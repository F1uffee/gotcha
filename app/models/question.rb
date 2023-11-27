class Question < ApplicationRecord
  has_many :games, through: :rounds
  belongs_to :proposal
  validates :question, uniqueness:{scope: :game_id}
end
