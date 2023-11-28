class AvatarsController < ApplicationController

  def create
    raise 
    @avatar = Avatar.new(params_avatar)
    @avatar.user_id = current_user.id
  end

private

  def params_avatar
    params.require(:avatar).permit(:name, :url)
  end
end
