class Player < ApplicationRecord
  has_many :player_bet_leagues
  has_many :bet_leagues, through: 'PlayerBetLeague'
  has_many :bets

  validates :name, :email, :password, presence: true
end
