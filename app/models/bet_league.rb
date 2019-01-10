class BetLeague < ApplicationRecord
  has_many :bets
  has_many :player_bet_leagues
  has_many :players, through: 'PlayerBetLeague'
  has_many :rounds

  validates :name, presence: true

  def display_name
    "#{self.name} \##{self.id}"
  end
end
