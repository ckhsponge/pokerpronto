class CardList 
  def initialize(s=nil)
    super()
    @array = Array.new
    return self unless s
    if s.kind_of?(String)
      s.scan(Card::CARD_REGEXP) {@array << Card.new($&)}
    elsif s.kind_of?(Array) || s.kind_of?(CardList)
      @array = s.to_a
    end
    self
  end
  
  def self.deck
    CardList.new((0..51).collect{|x| Card.lookup(x)})
  end
  
  def shuffle!
    size .downto 1 do |n| push(delete_at(rand(n))) end
    self
  end
  
  def swap_suits(suit1,suit2)
    return if suit1==suit2
    for card in @array
      if card.suit==suit1
        card.suit=suit2 
      elsif card.suit==suit2
        card.suit=suit1
      end
    end
  end
  
  def deep_clone
    CardList.new(@array.collect {|x| x.clone})
  end
  
  def value
    @array.collect{|x| x.index}.sum #sum of all cards
  end
  
  def self.random_hole_widow
      deck = CardList.deck.shuffle!
      hole = deck[0,2]
      widow = deck[2,[0,3,4,5][rand(4)]]
      return hole,widow
  end
  
  def to_i
    value
  end
  
  def to_a
    @array.clone
  end
  
  def self.parse(s)
     CardList.new(s)
  end
  
  def to_s
    return "" unless length>0
    join(" ")
  end
  
  def method_missing(method_name,*args)
    if @array.respond_to?(method_name)
      r = @array.send(method_name,*args)
      r = CardList.new(r) if r.kind_of?(Array)
      r
    else
      super(method_name,*args)
    end
  end
  
end
