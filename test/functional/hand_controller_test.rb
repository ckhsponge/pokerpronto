require File.dirname(__FILE__) + '/../test_helper'
require 'hand_controller'

# Re-raise errors caught by the controller.
class HandController; def rescue_action(e) raise e end; end

class HandControllerTest < Test::Unit::TestCase
  def setup
    @controller = HandController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
