class Avatar < ApplicationRecord
  belongs_to :user
  validates :name, presence:true
  validates :url, presence:true

  after_create_commit -> { broadcast_prepend_to "avatars", partial: "games/avatar", locals: { avatar: self }, target: "avatars" }
end
