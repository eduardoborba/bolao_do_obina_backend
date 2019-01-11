require 'test_helper'

class BetLeaguesServiceTest < ActiveSupport::TestCase
  setup do
    @bet_league = bet_leagues(:one)
    @round_one = rounds(:one)
    @round_two = rounds(:two)
  end

  test '#rounds should list round by bet league with proper attributes' do
    service = BetLeaguesService.new(@bet_league)

    rounds = service.rounds
    assert_equal 2, rounds.count

    first_round = rounds.first
    assert_equal @round_one.id, first_round[:id]
    assert_equal 2, first_round[:number_of_games]
    assert_equal 1, first_round[:round_number]

    second_round = rounds.second
    assert_equal @round_two.id, second_round[:id]
    assert_equal 0, second_round[:number_of_games]
    assert_equal 2, second_round[:round_number]
  end

  test '#player_scores should list player scores by bet league with proper attributes' do
    service = BetLeaguesService.new(@bet_league)

    player_scores = service.player_scores
    assert_equal 2, player_scores.count

    first_player = player_scores.first
    assert_equal 1, first_player[:position]
    assert_equal 'Eduardo Borba', first_player[:name]
    assert_equal 100, first_player[:score]

    second_player = player_scores.second
    assert_equal 2, second_player[:position]
    assert_equal 'João "Obina" Morinigo', second_player[:name]
    assert_equal 30, second_player[:score]
  end
end
