class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params_game)
    @game.user_id = current_user.id
    if @game.save
      redirect_to games_path(@games)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def params_game
    params.require(:game).permit(:name, :share_link, :status)
  end

end
