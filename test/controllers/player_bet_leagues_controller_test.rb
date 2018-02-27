require 'test_helper'

class PlayerBetLeaguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_bet_league = player_bet_leagues(:one)
  end

  test "should get index" do
    get player_bet_leagues_url, as: :json
    assert_response :success
  end

  test "should create player_bet_league" do
    assert_difference('PlayerBetLeague.count') do
      post player_bet_leagues_url, params: { player_bet_league: { bet_league_id: @player_bet_league.bet_league_id, player_accumulated_score: @player_bet_league.player_accumulated_score, player_id: @player_bet_league.player_id } }, as: :json
    end

    assert_response 201
  end

  test "should show player_bet_league" do
    get player_bet_league_url(@player_bet_league), as: :json
    assert_response :success
  end

  test "should update player_bet_league" do
    patch player_bet_league_url(@player_bet_league), params: { player_bet_league: { bet_league_id: @player_bet_league.bet_league_id, player_accumulated_score: @player_bet_league.player_accumulated_score, player_id: @player_bet_league.player_id } }, as: :json
    assert_response 200
  end

  test "should destroy player_bet_league" do
    assert_difference('PlayerBetLeague.count', -1) do
      delete player_bet_league_url(@player_bet_league), as: :json
    end

    assert_response 204
  end
end
