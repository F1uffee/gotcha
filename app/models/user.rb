class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :proposals
  has_many :votes
  has_many :questions, through: :proposals
  has_many :games, through: :game_users
  belongs_to :avatar
  validates :name, presence:true
  validates :avatar_id, presence:true
end
