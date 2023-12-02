class Game < ApplicationRecord
  STATUS = ["pending", "running", "finished"]
  validates :name, presence:true
  # validates :share_link, presence:true
  validates :status, inclusion: {in: STATUS}
  belongs_to :user
  has_many :rounds
  has_many :game_users
  has_many :questions, through: :rounds
  has_many :proposals
  has_many :users, through: :game_users
  has_many :votes

  def questions_votes
    out = []
    questions.each do |question|
      out << question.votes
      out.flatten
    end
    out.flatten
  end
end
