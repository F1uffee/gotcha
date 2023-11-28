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
      redirect_to games_path(@games)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private
  def params_game
    params.require(:game).permit(:name, :status)
  end

end
