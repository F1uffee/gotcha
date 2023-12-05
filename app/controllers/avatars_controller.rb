class AvatarsController < ApplicationController


  def new
  @avatar = Avatar.new
  @game = Game.find(params[:game_id])
  end


  def create
    @avatar = Avatar.new(avatar_params)
    @game = Game.find(params[:game_id]) if params[:game_id]
    @avatar.user_id = current_user.id

    url = params[:url]
    @avatar.url = url

    if @avatar.save
      @game_user = GameUser.create!(user_id: current_user.id, game_id: @game.id) if @game
      if @game
        redirect_to game_path(@game)
      else
        redirect_to new_game_path
      end
    else
      render "pages/home", status: :unprocessable_entity
    end
  end

  private

  def avatar_params
    params.require(:avatar).permit(:name, :url)
  end
end
