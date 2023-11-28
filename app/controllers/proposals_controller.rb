class ProposalsController < ApplicationController
  def new
    @proposal = Proposal.new
    @question = Question.find(params[:question_id])
  end

  def create
    @proposal = Proposal.new
  end
  def index
    # je peux voir toutes les réponses sauf la mienne
  end
end
