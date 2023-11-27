class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers
  has_many :votes
  has_many :questions, through: :answers
  has_many :games, through: :game_users
  belongs_to :avatar
end
