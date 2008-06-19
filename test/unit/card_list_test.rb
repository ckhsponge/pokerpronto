require File.dirname(__FILE__) + '/../test_helper'

class CardListTest < Test::Unit::TestCase
  #fixtures :card_lists

  # Replace this with your real tests.
  def test_truth
    assert 1,CardList.parse("2c 2d").value
    assert Card.new("2D"),CardList.parse("2c 2d").deep_clone[1]
    
    assert Card.new("2D"),CardList.deck[0]
    assert Card.new("2C"),CardList.deck[1]
    assert CardList.deck.shuffle!.include?(Card.new("2C"))
    
    assert Card.new("AS"),CardList.parse("AS KH")[0]
    assert Card.new("KH"),CardList.parse("AS KH")[1]
    assert Card.new("AS"),CardList.parse("AS,KH")[0]
    assert Card.new("KH"),CardList.parse("AS,KH")[1]
    assert Card.new("AS"),CardList.parse("ASmKH")[0]
    assert Card.new("KH"),CardList.parse("ASmKH")[1]
    
    full_house = CardList.new("10h10d7c7s7h")
    assert 5,full_house.length
    assert Card.new("th"),full_house[0]
    assert Card.new("td"),full_house[1]
    assert Card.new("7c"),full_house[2]
    assert Card.new("7s"),full_house[3]
    assert Card.new("7h"),full_house[4]
    
    full_house.sort!
    assert Card.new("7c"),full_house[0]
    assert Card.new("7h"),full_house[1]
    assert Card.new("7s"),full_house[2]
    assert Card.new("td"),full_house[3]
    assert Card.new("th"),full_house[4]
    
    acad = CardList.new("acad")
    acad.sort!
    assert Card.new("ac"),full_house[0]
    assert Card.new("ad"),full_house[1]
    
    acad = CardList.new("adac")
    acad.sort!
    assert Card.new("ac"),full_house[0]
    assert Card.new("ad"),full_house[1]
    
  end
end
