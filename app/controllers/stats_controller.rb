class StatsController < ApplicationController
  before_filter :authenticate
  
  def index
    @today_hits = HitCount.today
    @total_hits = HitCount.total
    @hit_counts = HitCount.find(:all)
    @hits = Hit.find(:all,:conditions=>["created_on > now() - interval 2 week"])
  end
  
  def self.max_count(data)
    max = 0
    for datum in data
      if datum.histogram_count>max
        max = datum.histogram_count
      end
    end
    max
  end
end