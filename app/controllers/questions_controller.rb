class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @all = @question.proposals.where.not(user_id: current_user.id)
    @array = @all.to_a
    @array << @question
    @shuffled_array = @array.shuffle!
    # @final_array = @array_of_proposal << @question.reponse
    # @shuffled_array = @final_array.shuffle

    # @array_without_mine = @final_array
  end



end
