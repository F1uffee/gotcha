class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params_game)
    @game.user_id = current_user.id
    @questions = Question.all
    if @game.save
      10.times do
        Round.create(game_id: @game.id, question_id: @questions.sample.id)
      end
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
    # unless @game.user_id == current_user.id || current_user.game_users.where(game_id: @game.id)
    #   redirect_to root_path
    # end
    if params[:question].nil?
      @question = @game.questions[0]
    else
      @question = @game.questions[params[:question].to_i]
    end

      if @game.status == "running" && @question.proposals.empty?
        redirect_to new_game_question_proposal_path(@game, @question)
      end
    @game_users = @game.game_users
    @avatars = @game_users.map do |game_user|
      @avatar = Avatar.where(user_id: game_user.user_id).last
    end
    @proposals = @game.proposals.to_a

    @owner = Avatar.where(user_id: @game.user_id).last
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
