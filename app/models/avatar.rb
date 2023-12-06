class Avatar < ApplicationRecord
  belongs_to :user
  validates :name, presence:true
  validates :url, presence:true


  before_save :assign_color
  after_create_commit -> { broadcast_prepend_to "avatars", partial: "games/avatar", locals: { avatar: self }, target: "avatars" }

  def assign_color
    player_colors = %w(pastel-green pastel-yellow pastel-red pastel-blue pastel-pink pastel-cyan)
    self.color = player_colors.sample
  end
end
