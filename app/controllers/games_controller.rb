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
      @avatar = Avatar.where(user_id: game_user.user_id).last
    end

    # on définit la variable owner
    @owner = Avatar.where(user_id: @game.user_id).last

    #  on définit un array de toutes les propositions du jeu
    @proposals = Proposal.where(game_id: @game.id).to_a

    #  on calcule le score de chaque avatar
    @avatars.each do |avatar|
      @avatar_proposals = Proposal.where(user_id: avatar.user_id )
      @avatar_proposals.each do |proposal|
        avatar.score += proposal.votes.count * 2
      end
      # je definir une variable avatar_vote = Vote.where(game_id:@game.id, user_id: avatar.user_id)
      # je vais selectionner uniquement ceux qui ont un question_id non nil
      # je vais eacher dessus et à chaque vote je vais rajouter 1 au score de l'avatar

    end

    # on calcule le score de l'owner
    @owner_proposals = Proposal.where(user_id: @owner.user_id )
    @owner_proposals.each do |proposal|
      @owner.score += proposal.votes.count * 2
    end
    # je definir une variable owner_vote = Vote.where(game_id:@game.id, user_id: @owner.user_id)
    # je vais selectionner uniquement ceux qui ont un question_id non nil
    # je vais eacher dessus et à chaque vote je vais rajouter 1 au score de l'owner
  end

  def update
    @game = Game.find(params[:id])
    @game.status = params[:status]
    @question = @game.questions[0]
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
    params.require(:game).permit(:name, :status)
  end

end
