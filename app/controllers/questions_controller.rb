class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @all = @question.proposals
    @array = @all.to_a
    @array << @question
    @shuffled_array = @array.shuffle!
    @game = Game.find(params[:game_id])
    @index = @game.questions.to_a.index(@question)
    # @modulo = @game.votes.count % @game.number_of_players
    # @questions_array = @game.questions.to_a
    # @questions_without_proposals = @questions_array.select do |question|
    #   question.proposals.empty?
    # end
    # @number_of_questions = @questions_without_proposals.count
    # @round_number = @game.questions.count - @number_of_questions
  end
end
