class Game < ApplicationRecord
  belongs_to :home, class_name: 'Team'
  belongs_to :visitor, class_name: 'Team'
  belongs_to :championship
  belongs_to :round
  belongs_to :bet_league

  validates :home_id, :visitor_id, :round_id, :bet_league_id, presence: true
end
