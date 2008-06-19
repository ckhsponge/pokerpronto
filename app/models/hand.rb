class Hand
  attr_accessor :query_time
  
  def initialize(h=nil,w=nil)
    @hole_cards=h
    @widow_cards=w
    @warnings=[]
    @errors=[]
    @opponent_count=1
  end
  def add_warning(s)
    @warnings << s
  end
  def warnings
    @warnings
  end
  def add_error(s)
    @errors << s
  end
  def errors
    @errors
  end
  def hole_cards=(h)
    @hole_cards=h
  end
  def hole_cards
    @hole_cards
  end
  def hole_string=(hs)
    @hole_cards=CardList.parse(hs)
  end
  def hole_string
    return "" unless @hole_cards
    @hole_cards.to_s
  end
  def widow_cards=(w)
    @widow_cards=w
  end
  def widow_cards
    @widow_cards
  end
  def widow_string=(ws)
    @widow_cards=CardList.parse(ws)
  end
  def widow_string
    return "" unless @widow_cards
    @widow_cards.to_s
  end
  def opponent_count
    @opponent_count
  end
  def opponent_count=(oc)
    @opponent_count=oc.to_i
  end
  def bet
    @bet
  end
  def bet=(b)
    @bet=b.to_f
  end
  def pot
    @pot
  end
  def pot=(p)
    @pot=p.to_f
  end
  
  def expected_p_wins_or_ties
    expected_p_wins+expected_p_ties
  end
  
  def expected_p_wins
    p_wins**opponent_count
  end
  
  def expected_p_ties
    1.0-expected_p_wins-expected_p_losses
  end
  
  def expected_p_losses
    1.0-p_wins_or_ties**opponent_count
  end
  
  def expected_value
    expectation = pot*expected_p_wins;
    tie_contrib = 0.0
    for i in 0...opponent_count
      win_power = opponent_count-i-1
      tie_power = i+1
      tie_contrib += (1.0/(i+2.0))*(p_ties**tie_power)*(p_wins**win_power)*(opponent_count.choose(i+1))
    end
    tie_contrib*=pot
    expectation+=tie_contrib
    expectation-=bet
    return expectation
  end
  
  def valid?
    return false unless @hole_cards && @hole_cards.length==2
    return false unless (@widow_cards.nil? || @widow_cards.length==0) ||
      (@widow_cards && [3,4,5].include?(@widow_cards.length))
    return !has_duplicates
  end
  
  def has_duplicates
    all_cards = @hole_cards+@widow_cards.to_a
    dupes = CardList.new
    all_cards.to_a.each_with_index{ |o,i| 
      dupes<<o if all_cards.index(o)!=i 
    }
    return nil unless dupes.length>0
    return dupes
  end
  
  def stat
    #return nil unless valid?
    return @stat if @stat
    #use deep_clone to ensure type remains CardList
    @hole_cards ||= CardList.new
    @widow_cards ||= CardList.new
    hole_cards= @hole_cards.deep_clone.sort!
    widow_cards= @widow_cards.deep_clone.sort!
    
    add_error("Duplicate card on table: #{has_duplicates}") if has_duplicates
    add_error("Not enough cards in the hole.") if hole_cards.length<2
    add_error("Too many cards in the hole.") if hole_cards.length>2
    if widow_cards.length>5
      add_error("Too many cards in widow.") 
    end
    return nil if errors && errors.length>0
    
    add_warning("Not enough cards in widow.") if [1,2].include?(widow_cards.length) 
      
    
    
    #for db, make sure hole cards are club,club or club,diamond
    if hole_cards[0].suit!=Card::CLUB
      swap_suit = hole_cards[0].suit
      hole_cards.swap_suits(Card::CLUB,swap_suit)
      widow_cards.swap_suits(Card::CLUB,swap_suit)
    end
    if hole_cards[1].suit!=Card::CLUB && hole_cards[1].suit!=Card::DIAMOND
      swap_suit = hole_cards[1].suit
      hole_cards.swap_suits(swap_suit,Card::DIAMOND)
      widow_cards.swap_suits(swap_suit,Card::DIAMOND)
    end
    widow_cards.sort!
    #previous_card=nil
    #in widow, now make sure lowest non-club-diamond is a heart
    #puts "pre fix widow #{widow_cards}"
    #tests: 2D 5H KC KD KS
    # 5H 5S KC KD KS
    #puts "widow value: #{widow_cards.value}"
    widow_cards_swapped = widow_cards.deep_clone.swap_suits(Card::SPADE,Card::HEART).sort!
    #puts "swapped: #{widow_cards_swapped}"
    #puts "swa widow value: #{widow_cards_swapped.value}"
    #if widow_cards.value!=widow_cards_swapped.value
    #  widow_cards = widow_cards_swapped if widow_cards.value>widow_cards_swapped.value
    #else
      for i in 0...widow_cards.length
        next unless widow_cards[i].suit!=widow_cards_swapped[i].suit
        if(widow_cards[i].suit==Card::HEART)
          break
        elsif widow_cards_swapped[i].suit==Card::HEART
          widow_cards = widow_cards_swapped
        end
      end
    #end
    #puts "post fix widow #{widow_cards}"
    
    start_time = Time.now
    @stat= case widow_cards.length
      when 0..2
        HoleStat.find(:first,
          :conditions=>["holes.card0=? and holes.card1=?",hole_cards[0].to_s,hole_cards[1].to_s],
          :joins=>"join holes on hole_stats.hole_id=holes.id"
        )
      when 3
        HoleWidowThreeStat.find(:first,
          :conditions=>["holes.card0=? and holes.card1=? and "+
          "widow_threes.card0=? and widow_threes.card1=? and widow_threes.card2=?",
          hole_cards[0].to_s,hole_cards[1].to_s,
          widow_cards[0].to_s,widow_cards[1].to_s,widow_cards[2].to_s],
          :joins=>"left join (holes,widow_threes) on "+
          "(hole_widow_three_stats.hole_id=holes.id and "+
          "hole_widow_three_stats.widow_three_id=widow_threes.id)"
        )
      when 4
        HoleWidowFourStat.find(:first,
          :conditions=>["holes.card0=? and holes.card1=? and "+
          "widow_fours.card0=? and widow_fours.card1=? and widow_fours.card2=? and widow_fours.card3=?",
          hole_cards[0].to_s,hole_cards[1].to_s,
          widow_cards[0].to_s,widow_cards[1].to_s,widow_cards[2].to_s,widow_cards[3].to_s],
          :joins=>"left join (holes,widow_fours) on "+
          "(hole_widow_four_stats.hole_id=holes.id and "+
          "hole_widow_four_stats.widow_four_id=widow_fours.id)"
        )
      when 5
        HoleWidowFiveStat.find(:first,
          :conditions=>["holes.card0=? and holes.card1=? and "+
          "widow_fives.card0=? and widow_fives.card1=? and widow_fives.card2=? and widow_fives.card3=? and widow_fives.card4=?",
          hole_cards[0].to_s,hole_cards[1].to_s,
          widow_cards[0].to_s,widow_cards[1].to_s,widow_cards[2].to_s,widow_cards[3].to_s,widow_cards[4].to_s],
          :joins=>"left join (holes,widow_fives) on "+
          "(hole_widow_five_stats.hole_id=holes.id and "+
          "hole_widow_five_stats.widow_five_id=widow_fives.id)"
        )
      else
        nil
    end
    end_time = Time.now
    @query_time=(end_time.to_f - start_time.to_f)
    HitCount.increment
    
    return @stat
  end
  
  def randomize_cards
    @hole_cards,@widow_cards = CardList.random_hole_widow
    @hole_string = @hole_cards.to_s
    @widow_string = @widow_cards.to_s
  end
  
  def empty?
    return (@hole_cards && @hole_cards.length>0) || (@widow_cards && @widow_cards.length>0)
  end
  
  def to_s
    "Hole: #{@hole_cards} Widow: #{@widow_cards}"
  end
  
  def method_missing(method_name,*args)
    if stat.respond_to?(method_name)
      return stat.send(method_name,*args)
    else
      super(method_name,*args)
    end
  end
end
