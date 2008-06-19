class Hole < ActiveRecord::Base

  def cards
    [Card.new(card0),Card.new(card1)]
  end
  
end
