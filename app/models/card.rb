class Card
  CARD_REGEXP = /([2-9]|A|K|Q|J|T|10)(C|D|H|S)/i
  CLUB="C"
  DIAMOND="D"
  HEART = "H"
  SPADE = "S"
  SUITS = [CLUB,DIAMOND,HEART,SPADE] #order of this array is relevent
  RANKS = %w( 2 3 4 5 6 7 8 9 T J Q K A)

  
  @text = nil
  def initialize(s)
    raise Exception.new("invalid argument: #{s}") unless s && (s.length==2 || s.length==3)
    @text=s.upcase.sub(/10/,"T")
    raise Exception.new("invalid argument - no match: #{@text}") unless valid
  end
  def valid
    return false unless @text && @text.length==2 || @text.length==3
    return false unless @text.match(CARD_REGEXP)
    true
  end
  #2,3,4,5,6,7,8,9,T,J,Q,K,A
  def rank
    @text[0,1]
  end
  #CLUB,DIAMOND,HEART,SPADE
  def suit
    @text[1,1]
  end
  #a numeric value of the rank, 2=>0,3=>1...A=>12
  ##this is poker value, AC has the same value as AD, use index for sorting
  def value
    RANKS.index(rank)
  end
  #every card has an index, 2c=0,2d=1,2h=3,2s=4,3c=5...
  def index
    r=(4*value+SUITS.index(suit))
    r
  end
  
  #opposite of index, returns a card
  def self.lookup(i)
    raise Exception.new("invalid argument: #{i}") unless i && i.kind_of?(Fixnum) && i>=0 && i<=51
    Card.new("#{RANKS[(i/4).floor]}#{SUITS[i%4]}")
  end
  
  def to_i
    index
  end
  
  def suit=(s)
    raise Exception.new("invalid argument: #{s}") unless s && SUITS.include?(s)
    @text[1]=s
  end
  
  def to_i
    value
  end
  
  def to_s
    @text
  end
  
  def clone
    Card.new(@text)
  end
  
  def ==(c)
    c && c.to_s==to_s
  end
  
  def <=>(c)
    index<=>c.index
    #s1 = value<=>c.value
    #return s1 unless s1==0
    #suit<=>c.suit
  end
  
end
