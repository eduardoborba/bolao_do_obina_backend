class Bet < ApplicationRecord
  belongs_to :game
  belongs_to :player
  belongs_to :bet_league
end
