module Stat
  
  def ties
    total-(wins+losses)
  end
  
  def wins_or_ties
    total-losses
  end
  
  def p_wins_or_ties
    1.0*wins_or_ties/total
  end
  
  def p_wins
    1.0*wins/total
  end
  
  def p_ties
    1.0*ties/total
  end
  
  def p_losses
    1.0*losses/total
  end
  
  def to_s
    "#{wins} #{losses} #{ties} #{total}"
  end
end