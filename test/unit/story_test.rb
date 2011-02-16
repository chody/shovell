require File.dirname(__FILE__) + '/../test_helper'

class StoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_should_not_be_valid_without_name
    s= Story.create(:name => nil, :link => 'http://www.testsubmission.com')
    assert s.errors.on(:name)
  end
  def test_should_not_be_valid_without_link
    s= Story.create(:name => 'My test submission', :link => nil)
    assert s.errors.on(:link)
  end
  def test_should_create_story
    s= Story.create(
    :name => 'My test submission'
    :link => 'http://www.testsubmission.com/'
    asserts.valid?)
    def test_should_have_a_votes_association
      assert_equal [ votes(:one), votes(:two) ],
        stories(:one).votes
    end
    def test_should_return_highest_vote_id_first
      assert_equal votes(:two), stories(:one).votes.lates.first
    end
    def test_should_return_3_latest_votes
      10.time { stories(:one).votes.create}
      assert_equal votes(:two), stories(:one).votes.latest.size
    end
end

