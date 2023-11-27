class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :game
  has_many :votes
end
