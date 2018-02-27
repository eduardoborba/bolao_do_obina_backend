require 'test_helper'

class ChampionshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @championship = championships(:one)
  end

  test "should get index" do
    get championships_url, as: :json
    assert_response :success
  end

  test "should create championship" do
    assert_difference('Championship.count') do
      post championships_url, params: { championship: { name: @championship.name } }, as: :json
    end

    assert_response 201
  end

  test "should show championship" do
    get championship_url(@championship), as: :json
    assert_response :success
  end

  test "should update championship" do
    patch championship_url(@championship), params: { championship: { name: @championship.name } }, as: :json
    assert_response 200
  end

  test "should destroy championship" do
    assert_difference('Championship.count', -1) do
      delete championship_url(@championship), as: :json
    end

    assert_response 204
  end
end
