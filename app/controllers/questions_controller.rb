class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @all = @question.proposals.where.not(user_id: current_user.id)
    @array = @all.to_a
    @array_of_proposal = @array.map{ |proposal| proposal.proposal}
    @final_array = @array_of_proposal << @question.reponse
    @shuffled_array = @final_array.shuffle
  end



end
