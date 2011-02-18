require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_should_be_associated_with_user
    assert_equal users(:cody), stories(:one).user
  end
end
