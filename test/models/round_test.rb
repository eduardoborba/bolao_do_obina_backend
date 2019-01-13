require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  setup do
    @round = rounds(:one)
    @obina = players(:obina)
    @eduardo = players(:eduardo)
  end

  test "#pending? returns true if player didn't bet on all games of the round" do
    assert_equal 2, @round.games.count
    assert_equal 2, Bet.where(player: @obina, game: @round.games).count
    refute @round.pending?(@obina)
  end

  test "#pending? returns false if player bet on all games of the round" do
    assert_equal 2, @round.games.count
    assert_equal 0, Bet.where(player: @eduardo, game: @round.games).count
    assert @round.pending?(@eduardo)
  end
end
