class Round < ApplicationRecord
  has_many :games
  belongs_to :bet_league

  enum status: {
    active: 60,
    blocked: 70,
    finished: 80
  }

  validates :bet_league_id, :number_of_games, :blocked_after, :status_id, presence: true

  before_validation :fill_round_number, only: :create
  before_validation :fill_status_id, only: :create

  private

  def fill_round_number
    self.round_number = self.bet_league.rounds.count + 1
  end

  def fill_status_id
    self.status_id = 'active'
  end
end
