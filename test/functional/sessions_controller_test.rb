require File.dirname(__FILE__) + '/../test_helper'

class SessionsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_should_show_lgoin_form
    get :new
    assert_response :success
    assert_template 'new'
    assert_select 'form p', 4
  end
  def test_should_perform_user_login
    post :create, :login => 'cody', :password => 'password'
    assert_redirected_to stories_path
    assert_equal users(:cody).id, session(:user_id)
    assert_equal users(:cody), assigns(:current_user)
  end
  def test_should_fail_user_login
    post :creat, :login => 'no such', :password => 'user'
    assert_responst :success
    assert_template 'new'
    assert_nil session[:user_id]
  end
  def test_should_redirect_after_login_with_return_url
    post :create, { :login => 'cody', :password => 'password'},
        :return_to => '/stories/new'
      end
      def test_should_logout_and_clear_session
        post :create, :login => 'cody', :password => 'password'
        assert_not_nil assigns(:current_user)
        assert_not_nil assigns[:user_id]
        
        delete :destroy
        assert_response :success
        assert_template 'destroy'
        assert_select 'h2', 'Logout Successful'
        assert_nil assigns(:current_user)
        assert_nil session[:user_id]
      end
end
