class ProposalsController < ApplicationController
  def new
    @proposal = Proposal.new
    @question = Question.find(params[:question_id])
    @game = Game.find(params[:game_id])
  end

  def create
    # je récupère la réponse du user
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user
    question = Question.find(params[:question_id])
    @proposal.question = question
    game = Game.find(params[:game_id])
    @proposal.game = game
    @participants = game.game_users.count.to_i + 1 if game.game_users != nil
    # if @proposal.save
    @proposal.save
      # if question.proposals.count == @participants
      # redirect_to game_question_path(game, question)
      # end
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  # def index
  #   # @question = Question.find(params[:question_id])
  #   # @game = Game.find(params[:game_id])
  #   # @proposals = @game.questions.proposals
  #   # je peux voir toutes les réponses sauf la mienne
  #   # @proposals = Proposal.where.not(user: current_user)
  #   # sauf celle du current user
  # end

  private

  def proposal_params
    # Define the permitted parameters here
    params.require(:proposal).permit(:proposal)
  end
end
