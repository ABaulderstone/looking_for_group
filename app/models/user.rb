class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games
  has_many :favorite_games, dependent: :destroy 
  has_many :favorites, through: :favorite_games, source: :game
end
