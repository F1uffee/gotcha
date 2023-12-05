class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :proposal, optional: true
  belongs_to :question, optional: true
  belongs_to :game, optional: true

  after_commit :reload, on: :create




  def reload
    modulo = self.game.votes.count % self.game.number_of_players
    questions_array = self.game.questions.to_a
    questions_without_proposals = questions_array.select do |question|
      question.proposals.empty?
    end
    number_of_questions = questions_without_proposals.count
    round_number = game.questions.count - number_of_questions
    if self.question.nil?
      self.question = self.proposal.question
      if modulo == 0 && self.game.votes.count == self.game.number_of_players * round_number
        broadcast_prepend_to "reload", partial: "questions/reload", locals: { game: self.game, question: self.question}, target: "reload"
      end
    elsif
      self.question = self.question
      if modulo == 0 && self.game.votes.count == self.game.number_of_players * round_number
        broadcast_prepend_to "reload", partial: "questions/reload", locals: { game: self.game, question: self.question}, target: "reload"
      end
    else
      return
    end
  end

end
