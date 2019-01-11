class RoundsService
  attr_accessor :round

  def initialize(round)
    self.round = round
  end

  def games
    Game.joins(:home)
        .joins(:visitor)
        .where(round: round)
        .order(position: :asc)
        .map do |game|
          {
            id: game.id,
            home_name: game.home.name,
            home_score: game.home_score,
            visitor_name: game.visitor.name,
            visitor_score: game.visitor_score,
          }
        end
  end

  def create!(params)
    params[:games].each_with_index do |game_param, index|
      Game.create!(
        home_id: game_param[:home_id],
        visitor_id: game_param[:visitor_id],
        round_id: round.id,
        bet_league_id: round.bet_league_id,
        position: index + 1
      )
    end

    true
  end

  def update!(params)
    params[:games].each do |game_param|
      game = @round.games.find(game_param[:id])
      game.home_id = game_param[:home_id] if game_param[:home_id].present?
      game.home_score = game_param[:home_score] if game_param[:home_score].present?
      game.visitor_id = game_param[:visitor_id] if game_param[:visitor_id].present?
      game.visitor_score = game_param[:visitor_score] if game_param[:visitor_score].present?
      game.save!
    end

    true
  end
end
