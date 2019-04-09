class Player < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :player_bet_leagues
  has_many :bet_leagues, through: :player_bet_leagues
  has_many :bets

  validates :name, :email, :password, presence: true

  # before_validation :set_provider

  # def set_provider
  #   self[:provider] = "email" if self[:provider].blank?
  # end
end
