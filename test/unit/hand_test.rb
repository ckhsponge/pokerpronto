require File.dirname(__FILE__) + '/../test_helper'

class HandTest < Test::Unit::TestCase
  #fixtures :holes

  def test_truth
    for i in 0...10000
      deck = CardList.deck.shuffle!
      hole = deck[0,2]
      widow = deck[2,[0,3,4,5][rand(4)]]
      #puts "h #{hole}"
      #puts "w #{widow}"
      hand = Hand.new(CardList.new(hole),CardList.new(widow))
      puts "trying hand: #{hand}"
      #puts "stat #{hand.stat}"
      assert hand.stat
      puts "found: #{hand.stat}"
    end
  end
end
