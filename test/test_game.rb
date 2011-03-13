require 'helper'
require 'game'

class TestShouldaSpike < Test::Unit::TestCase

  def roll pins, enumerator = 1.times
    enumerator.each { |t| @game.roll pins}
  end
  
  def roll_spare roll_one, roll_two
    @game.roll roll_one
    @game.roll roll_two
  end

  def roll_strike
    @game.roll 10
  end
  
  context "a game score" do
    setup do
      @game = Game.new
    end
    
    should "be 0 for an all-gutter game" do
      roll 0, 20.times
      assert_equal 0, @game.score
    end
    
    should "be 20 when player knoks 1 pin per roll" do
      roll 1, 20.times
      assert_equal 20, @game.score
    end
    
    should "count a spare at the beginning plus the bonus" do
      roll_spare 4, 6
      roll 3
      roll 4
      roll 0, 16.times
      assert_equal 20, @game.score
    end
    
    should "count a strike at the beginning plus the bonus" do
      roll_strike
      roll 3
      roll 4
      roll 0, 16.times
      assert_equal 24, @game.score
    end
    
    should "count a spare at the end plus the bonus" do
      roll 0, 18.times
      roll_spare 4, 6
      roll 7
      assert_equal 17, @game.score
    end
    
    should "count a strike at the end plus the bonus" do
      roll 0, 18.times
      roll_strike
      roll 7
      roll 3
      assert_equal 20, @game.score
    end

    should "count 300 for a perfect game" do
      12.times { roll_strike }
      assert_equal 300, @game.score
    end

  end
  
  
end
