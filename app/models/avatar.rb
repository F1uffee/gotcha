class Avatar < ApplicationRecord
  belongs_to :user
  validates :name, presence:true
  url :name, presence:true
end
