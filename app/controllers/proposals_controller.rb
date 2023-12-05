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
    puts "CONTROLLER #{@proposal.game.proposals_quantity}"
    @proposal.game.proposals_quantity = @proposal.game.proposals_quantity + 1
    puts "$" * 100
    puts "CONTROLLER #{@proposal.game.proposals_quantity}"
    puts "$" * 100
    if @proposal.save

      # redirect_to game_question_path(game, question)
    else
      render :new, status: :unprocessable_entity
    end
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
