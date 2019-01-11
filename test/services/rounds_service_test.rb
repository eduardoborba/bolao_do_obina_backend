require 'test_helper'

class RoundsServiceTest < ActiveSupport::TestCase
  setup do
    @round = rounds(:one)
    @second_round = rounds(:two)
    @game_one = games(:one)
    @game_two = games(:two)
    @flamengo = teams(:flamengo)
    @vasco = teams(:vasco)
  end

  test '#games_by_round should list games by round with proper attributes' do
    service = RoundsService.new(@round)

    games_by_round = service.games_by_round
    assert_equal 2, games_by_round.count

    assert_equal 1, games_by_round.first[:id]
    assert_equal 'Flamengo', games_by_round.first[:home_name]
    assert_equal 1, games_by_round.first[:home_score]
    assert_equal 'Vasco', games_by_round.first[:visitor_name]
    assert_equal 0, games_by_round.first[:visitor_score]

    assert_equal 2, games_by_round.second[:id]
    assert_equal 'Vasco', games_by_round.second[:home_name]
    assert_equal 0, games_by_round.second[:home_score]
    assert_equal 'Flamengo', games_by_round.second[:visitor_name]
    assert_equal 0, games_by_round.second[:visitor_score]
  end

  test '#create_round_games should create games to the round based on the params' do
    service = RoundsService.new(@second_round)

    assert_difference('Game.count', +2) do
      service.create_round_games({
        games: [{
          home_id: @flamengo.id,
          visitor_id: @vasco.id
        }, {
          home_id: @vasco.id,
          visitor_id: @flamengo.id
        }]
      })
    end

    created_games = @second_round.games.order(created_at: :asc)

    first_game = created_games.first
    assert_equal @flamengo.id, first_game.home_id
    assert_equal @vasco.id, first_game.visitor_id
    assert_equal @second_round.id, first_game.round_id
    assert_equal @second_round.bet_league_id, first_game.bet_league_id
    assert_equal 1, first_game.position

    second_game = created_games.second
    assert_equal @vasco.id, second_game.home_id
    assert_equal @flamengo.id, second_game.visitor_id
    assert_equal @second_round.id, second_game.round_id
    assert_equal @second_round.bet_league_id, second_game.bet_league_id
    assert_equal 2, second_game.position

  end

  test '#update_round_games should update permitted attributes properly' do
    service = RoundsService.new(@round)

    assert_no_difference('Game.count') do
      service.update_round_games({
        games: [{
          id: @game_one.id,
          home_score: 2,
          visitor_score: 1
        }, {
          id: @game_two.id,
          home_score: 3,
          visitor_score: 2
        }]
      })
    end

    updated_games = @round.games.order(created_at: :asc)

    first_game = updated_games.first
    assert_equal @flamengo.id, first_game.home_id
    assert_equal 2, first_game.home_score
    assert_equal @vasco.id, first_game.visitor_id
    assert_equal 1, first_game.visitor_score
    assert_equal @round.id, first_game.round_id
    assert_equal @round.bet_league_id, first_game.bet_league_id
    assert_equal 1, first_game.position

    second_game = updated_games.second
    assert_equal @vasco.id, second_game.home_id
    assert_equal 3, second_game.home_score
    assert_equal @flamengo.id, second_game.visitor_id
    assert_equal 2, second_game.visitor_score
    assert_equal @round.id, second_game.round_id
    assert_equal @round.bet_league_id, second_game.bet_league_id
    assert_equal 2, second_game.position
  end
end
