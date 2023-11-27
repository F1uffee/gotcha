class Avatar < ApplicationRecord
  AVATARS = ["", "", ""]
  validates :avatar, inclusion: {in: AVATARS}
  has_many :users
end

