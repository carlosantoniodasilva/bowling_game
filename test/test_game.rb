require 'test_helper'

class TestGame < Test::Unit::TestCase
  def setup
    @game = BowlingGame.new
  end

  def test_gutter_game
    roll_many(20, 0)
    assert_equal 0, @game.score
  end

  def test_all_ones
    roll_many(20, 1)
    assert_equal 20, @game.score
  end

  def test_one_spare
    roll_spare
    @game.roll(3)
    roll_many(17, 0)
    assert_equal 16, @game.score
  end

  def test_one_strike
    roll_strike
    @game.roll(3)
    @game.roll(4)
    roll_many(16, 0)
    assert_equal 24, @game.score
  end

  def test_perfect_game
    roll_many(12, 10)
    assert_equal 300, @game.score
  end

  private

  def roll_many(n, pins)
    1.upto(n) do
      @game.roll(pins)
    end
  end

  def roll_spare
    @game.roll(5)
    @game.roll(5)
  end

  def roll_strike
    @game.roll(10)
  end
end