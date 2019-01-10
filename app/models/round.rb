class Round < ApplicationRecord
  has_many :games
  belongs_to :bet_league

  enum status: {
    active: 60,
    blocked: 70,
    finished: 80
  }, _prefix: :status

  validates :bet_league_id, :number_of_games, :blocked_after, :status_id, presence: true

  before_create :fill_round_number

  private

  def fill_round_number
    self.round_number = self.bet_league.rounds.count + 1
  end
end
