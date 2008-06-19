# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def fmt_percent(f)
    return "" unless f
    sprintf("%2.1f",100*f)
  end
  
  def fmt_money(f)
    return "" unless f
    sprintf("%.2f",f)
  end
  
  def fmt_long(l)
    return "" unless l
    l.to_s.gsub(/(\d)(?=\d{3}+(\.\d*)?$)/, '\1,')
  end
  
  #milliseconds
  def fmt_ms(f)
    return "" unless f
    sprintf("%1.3f",f)
  end
  
  def fmt_cards(cards)
    return "" unless cards && cards.length>0
    cards.to_a.collect{|c| fmt_card(c)}.join("&nbsp;&nbsp;")
  end
  
  def fmt_card(card)
    return "" unless card
    s = ""
    s += "<font size=\"5\">"
    s += card.rank
    s += "<img src=\"/images/"
    s += case card.suit
      when "C"
        "club.gif"
      when "D"
        "diamond.gif"
      when "H"
        "heart.gif"
      when "S"
        "spade.gif"
    end
    s+= "\"/></font>"
    s
  end
end
