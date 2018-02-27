require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url, as: :json
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post games_url, params: { game: { championship_id: @game.championship_id, date_time: @game.date_time, home_id: @game.home_id, home_score: @game.home_score, visitor_id: @game.visitor_id, visitor_score: @game.visitor_score } }, as: :json
    end

    assert_response 201
  end

  test "should show game" do
    get game_url(@game), as: :json
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { championship_id: @game.championship_id, date_time: @game.date_time, home_id: @game.home_id, home_score: @game.home_score, visitor_id: @game.visitor_id, visitor_score: @game.visitor_score } }, as: :json
    assert_response 200
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete game_url(@game), as: :json
    end

    assert_response 204
  end
end
