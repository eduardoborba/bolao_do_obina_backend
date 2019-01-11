require 'test_helper'

class RoundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @round = rounds(:one)
    @game_one = games(:one)
    @game_two = games(:two)
  end

  test "should get index" do
    get rounds_url, as: :json
    assert_response :success
  end

  test "should create round" do
    assert_difference('Round.count') do
      assert_difference('Game.count', +2) do
        post rounds_url, params: {
          round: {
            bet_league_id: @round.bet_league_id,
            blocked_after: @round.blocked_after,
            number_of_games: 2
          },
          games: [{
            home_id: @game_one.home_id,
            visitor_id: @game_one.visitor_id
          }, {
            home_id: @game_two.home_id,
            visitor_id: @game_two.visitor_id
          }]
        }, as: :json
      end
    end

    assert_response 201
  end

  test "should show round" do
    get round_url(@round), as: :json
    assert_response :success

    response = JSON.parse(@response.body)

    assert_equal response['round']['id'], @round.id
    assert_equal response['games'][0]['id'], @game_one.id
    assert_equal response['games'][1]['id'], @game_two.id
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
