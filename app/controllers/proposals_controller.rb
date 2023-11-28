class ProposalsController < ApplicationController
  def new
    @proposal = Proposal.new
    @question = Question.find(params[:question_id])
  end

  def create
    @proposal = Proposal.new
    # je dois récupérer la new
    # je dois récupérer l'id de la question
    # id du current user
  end

  def index
    # je peux voir toutes les réponses sauf la mienne
    @proposals = Proposal.all
    # sauf celle du current user
  end
end
