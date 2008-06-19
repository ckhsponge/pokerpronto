require File.dirname(__FILE__) + '/../test_helper'

class HitCountTest < Test::Unit::TestCase
  #fixtures :hit_counts

  # Replace this with your real tests.
  def test_truth
    HitCount.increment
    HitCount.increment
    HitCount.increment
  end
end
