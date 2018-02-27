require 'test_helper'

class BetLeaguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bet_league = bet_leagues(:one)
  end

  test "should get index" do
    get bet_leagues_url, as: :json
    assert_response :success
  end

  test "should create bet_league" do
    assert_difference('BetLeague.count') do
      post bet_leagues_url, params: { bet_league: { name: @bet_league.name } }, as: :json
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
