class Question < ApplicationRecord
  has_many :rounds
  has_many :games, through: :rounds
  has_many :proposals
  has_many :votes, dependent: :destroy
end
