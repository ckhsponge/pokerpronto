class HitCount < ActiveRecord::Base
  #default created_on uses date/time, we only want date
  ActiveRecord::Base.record_timestamps=false
  
  def histogram_count
    self.count
  end
  
  def histogram_column_name
    self.created_on.to_s
  end
  
  def self.increment
    result = HitCount.update_all("count = count+1",["created_on=?",Date.today])
    if result==0
      hc = HitCount.new(:count=>1,:created_on=>Date.today)
      hc.save
    end
  end
  
  def self.today
    hc = HitCount.find(:first,:conditions=>["created_on=?",Date.today])
    return 0 unless hc
    hc.count
  end
  
  def self.total 
    hc = HitCount.find_by_sql("select sum(count) count from hit_counts")
    return 0 unless hc
    hc = hc[0] if hc.kind_of?(Array)
    hc.count
  end
end
