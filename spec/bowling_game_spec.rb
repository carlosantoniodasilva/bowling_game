require 'spec_helper'

describe BowlingGame do

  before(:each) do
    @game = BowlingGame.new
  end

  it "should calculate a gutter game" do
    roll_many(20, 0)
    @game.score.should == 0
  end

  it "should calculate an all ones game" do
    roll_many(20, 1)
    @game.score.should == 20
  end

  it "should calculate a spare" do
    roll_spare
    @game.roll(3)
    roll_many(17, 0)
    @game.score.should == 16
  end

  it "should calculate a strike" do
    roll_strike
    @game.roll(3)
    @game.roll(4)
    roll_many(16,0)
    @game.score.should == 24
  end

  it "should calculate a perfect game" do
    12.times { roll_strike }
    @game.score.should == 300
  end

  private

   def roll_many(n, pins)
    n.times { @game.roll(pins) }
  end

  def roll_spare
    @game.roll(5)
    @game.roll(5)
  end

  def roll_strike
    @game.roll(10)
  end
end