class BetLeague < ApplicationRecord
  has_many :bets
  has_many :player_bet_leagues
  has_many :players, through: :player_bet_leagues
  has_many :rounds
  belongs_to :owner, class_name: 'Player'

  validates :name, :owner_id, :status_id, presence: true

  enum status: {
    active: 60,
    finished: 80
  }

  def display_name
    "#{self.name} \##{self.id}"
  end
end
