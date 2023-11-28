class AvatarsController < ApplicationController


  def new
  @avatar = Avatar.new
  @game = Game.find(params[:game_id])
  end


  def create
  @avatar = Avatar.new(avatar_params)
  @game = Game.find(params[:game_id])
  @avatar.user_id = current_user.id
    if @avatar.save
      @game_user = GameUser.create!(user_id: current_user.id, game_id: @game.id)
      raise
      redirect_to games_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def avatar_params
    params.require(:avatar).permit(:name, :url)
  end
end
