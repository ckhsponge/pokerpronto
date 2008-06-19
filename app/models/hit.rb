class Hit < ActiveRecord::Base
  ActiveRecord::Base.record_timestamps=true
  
  def self.create(args)
    request = args[:request]
    url = request.env['REQUEST_URI'] if request
    url = Hit.trim_http(url)
    slash_index=nil
    slash_index = url.index("/") if url
    url = url[slash_index,url.length] if url && slash_index && slash_index>0
    self.create_by_url(url,args)
  end
  
  def self.create_by_url(url,args)
    request = args[:request]
    
    remote_addr = nil
    remote_addr = request.env["REMOTE_ADDR"] if request
    referer = nil
    referer = Hit.trim_http(request.env["HTTP_REFERER"]) if request

    hit = Hit.new(:created_on=>Time.now,:url=>url[0,99],:remote_addr=>remote_addr,:referer=>referer)
    hit.save!

  end
  
  def self.trim_http(s)
    return nil unless s
    return s[7,s.length] if s.index("http://")==0
    return s
  end
end