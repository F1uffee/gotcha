class Game < ApplicationRecord
  belongs_to :user
  has_many :questions, through: :rounds
  has_many :answers
  has_many :users, through: :game_users
end
