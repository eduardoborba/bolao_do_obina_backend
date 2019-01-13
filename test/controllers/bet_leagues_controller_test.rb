require 'test_helper'

class BetLeaguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bet_league = bet_leagues(:one)
    @player = players(:obina)
  end

  test "should get index" do
    get bet_leagues_url(player_id: @player.id), as: :json
    assert_response :success

    response = JSON.parse(@response.body)

    assert_equal 1, response["bet_leagues"].count
  end

  test "should create bet_league" do
    assert_difference('BetLeague.count') do
      post bet_leagues_url, params: {
        bet_league: {
          name: @bet_league.name,
          owner_id: @player.id
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show bet_league" do
    get bet_league_url(@bet_league), as: :json
    assert_response :success
  end

  test "should update bet_league" do
    patch bet_league_url(@bet_league), params: { bet_league: { name: @bet_league.name } }, as: :json
    assert_response 200
  end

  test "should destroy bet_league" do
    assert_difference('BetLeague.count', -1) do
      delete bet_league_url(@bet_league), as: :json
    end

    assert_response 204
  end
end
