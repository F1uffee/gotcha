class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params_game)
    @game.user_id = current_user.id
    @questions = Question.all
    if @game.save
      3.times do
        Round.create(game_id: @game.id, question_id: @questions.sample.id)
      end
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])

    #  on donne un index à la question
    if params[:question].nil?
      @question = @game.questions[0]
    else
      @question = @game.questions[params[:question].to_i]
    end

    # on gère la redirection à chaque manche
      if @game.status == "running" && @question.proposals.empty?
        redirect_to new_game_question_proposal_path(@game, @question)
      end

    #  on définit la variable avatars
    @game_users = @game.game_users
    @avatars = @game_users.map do |game_user|
      @avatar = Avatar.where(user: game_user.user).last
    end
    # @avatars.each_with_index do |avatar, index|
    #   player_colors = %w(pastel-yellow pastel-red pastel-blue pastel-pink pastel-cyan)
    #   avatar.color = player_colors[index]
    # end

    # on définit la variable owner
    @owner = Avatar.where(user_id: @game.user_id).last
    @owner.color = "pastel-green"

    #  on définit un array de toutes les propositions du jeu
    @proposals = Proposal.where(game_id: @game.id).to_a

    #  on calcule le score de chaque avatar
    @avatars.each do |avatar|
      # je definis une variable avatar_vote qui correspond aux votes qu'à fait l'avatar sur la bonne réponse
      @avatar_votes = Vote.where(game_id: @game.id, user_id: avatar.user_id, proposal_id: nil)
      # je vais eacher dessus et à chaque vote je vais rajouter 1 au score de l'avatar
      @avatar_votes.each do |vote|
        avatar.score += 1
      end
      # je definis une variable avatar_proposals qui correspond aux propositions faites par l'avatar
      @avatar_proposals = Proposal.where(user_id: avatar.user_id, game_id: @game.id)
      # je vais eacher dessus et rajouter 2 points au score de l'avatar pour chaque vote sur cette proposition
      @avatar_proposals.each do |proposal|
        avatar.score += proposal.votes.count * 2
      end
    end

    # on calcule le score de l'owner
    @owner_proposals = Proposal.where(user_id: @owner.user_id, game_id: @game.id)
    @owner_proposals.each do |proposal|
      @owner.score += proposal.votes.count * 2
    end
    # je definis une variable owner_vote
    @owner_votes = Vote.where(game_id: @game.id, user_id: @owner.user_id, proposal_id: nil)
    # je vais eacher dessus et à chaque vote je vais rajouter 1 au score de l'owner
    @owner_votes.each do |vote|
      @owner.score += 1
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.status = params[:status]
    @question = @game.questions[0]
    @game.number_of_players = @game.game_users.count + 1
    @game.update(status:params[:status])
    if @game.status == "running"
      redirect_to new_game_question_proposal_path(@game, @question)
    else
      @game.proposals.destroy_all
      redirect_to root_path
    end
  end

  private
  def params_game
    params.require(:game).permit(:name, :status, :proposals_quantity, :number_of_players)
  end

end
