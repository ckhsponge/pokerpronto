class Advertisement
  IMAGE_DIR = "/images/"
  
  @@advertisements = nil
  
  def self.advertisements
    return @@advertisements if @@advertisements
    @@advertisements = Advertisement.init_advertisements
  end
  
  def self.init_advertisements
    a = []
    
    #amazon
    a << "<iframe width='468' height='60' src='http://rcm.amazon.com/e/cm?t=pokerprontoco-20&o=1&p=26&l=dl1&f=ifr' " +
    "scrolling='no' border='0' frameborder='0' style='border:none;'></iframe>"
    
    #amazon
    a << "<iframe width='468' height='60' src='http://rcm.amazon.com/e/cm?t=pokerprontoco-20&o=1&p=13&l=ez&f=ifr' " +
    "scrolling='no' border='0' frameborder='0' style='border:none;'></iframe>"
    
    #netflix
    a << "<a href=\"http://click.linksynergy.com/fs-bin/click?id=qFdWfJ7JM7Q&offerid=78684.10000092&type=4&subid=0\"><IMG alt=\"Netflix, Inc.\" border=\"0\" src=\"http://cdn.netflix.com/us/affiliates/banners/0804/468060C_100704.gif\"></a><IMG border=\"0\" width=\"1\" height=\"1\" src=\"http://ad.linksynergy.com/fs-bin/show?id=qFdWfJ7JM7Q&bids=78684.10000092&type=4&subid=0\">"
 
    if PokerprontoEnvironment::USE_GAMBLING_ADS
      #partypoker
      a << "<a href=\"http://www.partypoker.com/index.htm?bc=20100&wm=2789181\" " +
      "target=\"_blank\">" +
      "<img src=\""+IMAGE_DIR+"pp100extra_468x60_m.gif\" hspace=\"0\" vspace=\"0\" border=\"0\"></a>"
  		
      #partypoker
      a << "<a href='http://www.partypoker.com/index.htm?wm=2171827' target='_blank'>"+
      "<img src='"+IMAGE_DIR+"pp_extra468x60_4.gif' hspace='0' vspace='0' border='0'></a>"
      
      #pokerroom
      a << "<a href=\"http://www.pokerroom.com/?ref=6270\"><img src=\"http://www3.pokerroom.com/pokeraffiliate/img/PR_fish_468x60.gif\" border=\"0\" height=\"60\" width=\"468\" alt=\"PokerRoom.com\" /></a>"
      
      		#"<a href='http://www.planetpoker.com/index.asp?aSource=1001289' target='_blank'>" +
      #"<img src='"+IMAGE_DIR+"pp-vegas2.gif' hspace='0' vspace='0' border='0'></a>",
      
      #"<a href='http://www.truepoker.com/index.asp?code=c9bAFJax0' target='_blank'>"+
      #"<img src='"+IMAGE_DIR+"tp468x60_20percent.gif' hspace='0' vspace='0' border='0'></a>",
      
      #888 - pacific poker
      a << "<a href=\"http://es.pacificpoker.com/?sr=335014&flag=1101\"><IMG SRC=\"http://Marketing.888.com//PacificPoker/ES/Banners/22532-1-468x60_pksp_li.gif\" BORDER=\"0\"></a>"
      
      #888 - casino on net
      a << "<a href=\"http://www.888.com/?sr=379952&lang=jp&flag=1101\"><IMG SRC=\"http://Marketing.888.com//CasinoOnNet/JA/Banners/16325-468x60.gif\" BORDER=\"0\"></a>"
      
      #pokerlistings
      a << "<table width=\"468\" height=\"60\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border:1px solid #627678; width:468px; height:60px;\"><tr>	<td valign=\"top\" bgcolor=\"#FFFFFF\" width=\"80\" style=\"width: 80px;\" rowspan=\"2\"><a href=\"http://www.pokerlistings.com?affid=128\" target=\"_blank\"><img src=\"http://www.pokerlistings.com/images/ads/ads_misc/aceOfClubsSmall.jpg\" width=\"80\" height=\"60\" alt=\"PokerListings.com - Online Poker Guide\" border=\"0\"></a></td><td valign=\"top\" bgcolor=\"000000\" width=\"388\" style=\"width: 388px;\">		<div style=\"margin-top:0px; margin:0px 3px; font-family:Arial; font-size:11px; color:#ffffff; font-weight: bold\"><a href=\"http://www.pokerlistings.com?affid=128\" target=\"_blank\" style=\"color:#ffffff; font-weight:bold; font-size:11px; font-family:Arial; text-decoration:underline\">Poker<span style=\"font-size:1px;\">&nbsp;</span>Listings.com</a> - Leading Online Poker Guide.<br></div></td></tr><tr><td valign=\"top\" background=\"http://www.pokerlistings.com/images/ads/ads_misc/bgGreenRound.gif\" width=\"388\" style=\"width: 388px;\"><div style=\"margin:2px 3px; font-family:Arial; font-size:11px; color:#ffffff; font-weight: normal\">Find your <a href=\"http://www.pokerlistings.com/poker-chips?affid=128\" style=\"color:#ffffff;\" target=\"_blank\">poker chips</a> at PokerListings!			We list more than 35 <a href=\"http://www.pokerlistings.com/poker-supplies?affid=128\" style=\"color:#ffffff;\" target=\"_blank\">poker supplies retailers</a>.All retailers are ranked in real time at world's largest <a href=\"http://www.pokerlistings.com?affid=128\" style=\"color:#ffffff;\" target=\"_blank\">online poker</a> guide.</div></td></tr></table>"
    end
    
    return a
  end
  
  def self.random
    Advertisement.advertisements[rand(Advertisement.advertisements.length)]
  end
  
  def self.all
    Advertisement.advertisements
  end
end