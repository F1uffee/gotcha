class ProposalsController < ApplicationController
  def new
    @proposal = Proposal.new
    @question = Question.find(params[:question_id])
  end

  def create
    # je récupère la réponse du user
    @proposal = Proposal.new
    # game id
    if @proposal.save
      redirect_to @proposal
    end
  end

  def index
    # je peux voir toutes les réponses sauf la mienne
    @proposals = Proposal.where.not(user: current_user)
    # sauf celle du current user
  end

  

end
