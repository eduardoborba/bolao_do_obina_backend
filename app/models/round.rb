class Round < ApplicationRecord
  has_many :games
  belongs_to :bet_league

  enum status: {
    active: 60,
    blocked: 70,
    finished: 80
  }

  validates :bet_league_id, :number_of_games, :blocked_after, :status_id, presence: true

  def pending?(player)
    self.active? && Bet.where(player: player, game: self.games).count != self.number_of_games
  end

  def active?
    self.status_id == Round.statuses[:active]
  end

  def blocked?
    self.status_id == Round.statuses[:blocked]
  end

  def finished?
    self.status_id == Round.statuses[:finished]
  end
end
