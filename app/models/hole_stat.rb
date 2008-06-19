class HoleStat < ActiveRecord::Base
  include Stat
  
  belongs_to :hole
end
