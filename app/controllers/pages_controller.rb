class PagesController < ApplicationController
  def home
    @avatar = Avatar.new
  end
end
