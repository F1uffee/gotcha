class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @avatar = Avatar.new(user: current_user)
  end
end
