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
    @vote.question = Question.find(params[:vote][:question_id])
    @vote.proposal = Proposal.find(params[:proposal_id])
    @vote.save
  end
end
