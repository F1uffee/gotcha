class AvatarsController < ApplicationController
  def new
    @avatar = Avatar.new
  end


  def create
    @avatar = Avatar.new(params_avatar)
    @avatar.user_id = current_user.id
  end

private

  def params_avatar
    params.require(:avatar).permit(:name, :url)
  end
end
