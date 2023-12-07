class AvatarsController < ApplicationController


  def new
  @avatar = Avatar.new
  @game = Game.find(params[:game_id])
  end


  def create

    player_colors = %w(pastel-yellow pastel-red pastel-blue pastel-pink pastel-cyan)

    @avatar = Avatar.new(avatar_params)
    if params[:game_id]
      @game = Game.find(params[:game_id])
      @avatar.color = player_colors[@game.users.count]
    else
      @avatar.color = player_colors.first
    end
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
      if @game
        render :new, status: :unprocessable_entity
      else
        render "pages/home", status: :unprocessable_entity
      end
    end
  end

  private

  def avatar_params
    params.require(:avatar).permit(:name, :url)
  end
end
