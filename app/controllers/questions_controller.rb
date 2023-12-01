class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @all = @question.proposals
    @array = @all.to_a
    @array << @question
    @shuffled_array = @array.shuffle!
    @game = Game.find(params[:game_id])
    @index = @game.questions.to_a.index(@question)
  end
end
