require 'test_helper'

class RoundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @round = rounds(:one)
  end

  test "should get index" do
    get rounds_url, as: :json
    assert_response :success
  end

  test "should create round" do
    assert_difference('Round.count') do
      post rounds_url, params: { round: { bet_league_id: @round.bet_league_id, blocked_after: @round.blocked_after, number_of_games: @round.number_of_games, status_id: @round.status_id } }, as: :json
    end

    assert_response 201
  end

  test "should show round" do
    get round_url(@round), as: :json
    assert_response :success
  end

  test "should update round" do
    patch round_url(@round), params: { round: { bet_league_id: @round.bet_league_id, blocked_after: @round.blocked_after, number_of_games: @round.number_of_games, round_number: @round.round_number, status_id: @round.status_id } }, as: :json
    assert_response 200
  end

  test "should destroy round" do
    assert_difference('Round.count', -1) do
      delete round_url(@round), as: :json
    end

    assert_response 204
  end
end
