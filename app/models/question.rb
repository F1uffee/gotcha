class Question < ApplicationRecord
  has_many :games, through: :rounds
  belongs_to :answer
end
