class VotesController < ApplicationController

  def create
    # @proposal = Proposal.find(params[:proposal_id])
    # recuperer le vote qui l'user_id question_id et supprimer le vote
    # règle des votes pour sélectionner les votes  à effacer
    # les votes de user
    # question _id
    @question = Question.find(params[:vote][:question_id])

    Vote.where(user: current_user, question: @question).destroy_all
    # @proposal = Proposal.find(params[:vote][:proposal_id])
    # Vote.where(user: current_user, proposal: @proposal).destroy_all
    @vote = Vote.new
    @vote.user = current_user

    if params[:proposal_id]
      @vote.proposal = Proposal.find(params[:proposal_id])
      @vote.game = Game.find(params[:vote][:game_id]) if params[:vote][:game_id].present?
    else
      @vote.question = Question.find(params[:vote][:question_id])
      @vote.game = Game.find(params[:game_id]) if params[:game_id].present?
    end
    @vote.save!
  end

end
