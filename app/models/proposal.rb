class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :game
  has_many :votes, dependent: :destroy

  # after_create_commit -> { :redirect_after_proposal }
  after_commit :redirect_after_proposal, on: :create

  def redirect_after_proposal
    # raise
    if self.game.proposals.count % self.game.number_of_players == 0
      round_number = (self.game.proposals.count / self.game.number_of_players) - 1
      puts "*" * 100
      puts "proposals_quantity : #{self.game.proposals.count}"
      puts "number_of_players : #{self.game.number_of_players}"
      puts round_number
      puts "*" * 100
      broadcast_prepend_to "redirect", partial: "proposals/redirect_after_create_proposal", locals: { game: self.game, question: self.game.questions[round_number] }, target: "redirect"
    else
      return
    end
  end

end
