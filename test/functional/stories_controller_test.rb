require File.dirname(__FILE__) + '/../test_helper'

class StoriesControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_should_show_index
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil (:story)
  end
  def test_should_show_new
    get :new
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:story)
  end
  def test_should_show_new_form
    get :new
    assert_select 'form p', :count =>3
  end
  def test_should_add_story
    post :create, :story => {
      :name => 'Test Story',
      :link => 'http://www.test.com'
    }
    assert ! assigns(:story).new_record?
    assert_redirected_to stories_path
    assert_not_nil flash[:notice]
  end
  def test_should_reject_missing_story_attribute
    post :create, :story=> { :name => 'story without a link' }
    assert assigns(:story).errors.on(:link)
  end
end

