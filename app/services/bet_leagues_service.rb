class BetLeaguesService
  attr_accessor :bet_league

  def initialize(bet_league)
    self.bet_league = bet_league
  end

  def rounds
    bet_league.rounds
              .order(round_number: :asc)
              .map do |round|
                {
                  id: round.id,
                  round_number: round.round_number,
                  status: round.status_id,
                  number_of_games: round.number_of_games
                }
              end
  end

  def player_scores
    bet_league.player_bet_leagues
              .joins(:player)
              .order(player_accumulated_score: :desc)
              .map.with_index do |player_bet_league, index|
                {
                  position: index + 1,
                  name: player_bet_league.player.name,
                  score: player_bet_league.player_accumulated_score
                }
              end
  end
end
