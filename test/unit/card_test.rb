require File.dirname(__FILE__) + '/../test_helper'

class CardTest < Test::Unit::TestCase

  # Replace this with your real tests.
  def test_truth
    assert_equal "AS",Card.new("AS").to_s
    assert_equal 12,Card.new("AS").value
    assert_equal 12,Card.new("AS").to_i
    assert_equal "A",Card.new("AS").rank
    assert_equal "S",Card.new("AS").suit
    
    assert_equal "AS",Card.new("as").to_s
    
    ranks = %w{2 3 4 5 6 7 8 9 10 T J Q K A t j q k a}
    expected_ranks = %w{2 3 4 5 6 7 8 9 T T J Q K A T J Q K A}
    suits = %w{C D H S c d h s}
    expected_suits = %w{C D H S C D H S}
    
    for rank_index in 0...ranks.length
      for suit_index in 0...suits.length
        puts "#{expected_ranks[rank_index]}#{expected_suits[suit_index]} #{ranks[rank_index]}#{suits[suit_index]}"
        assert_equal "#{expected_ranks[rank_index]}#{expected_suits[suit_index]}",
          Card.new("#{ranks[rank_index]}#{suits[suit_index]}").to_s
      end
    end
  end
end
