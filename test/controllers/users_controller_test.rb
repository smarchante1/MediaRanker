require "test_helper"

describe UsersController do
  let(:user) { users(:one) }

  it "should get the login page" do
    get login_path

    must_respond_with :success
  end

  describe "login action" do
    it "flashes success when existing user logs in" do
      test_user = {
        "user": {
          username: user.username,
        },
      }

      expect {
        post login_path, params: test_user
      }.wont_change "User.count"

      expect(flash[:success]).must_equal "Welcome back, #{user.username}."
    end
  end

  describe "current action" do 
    it "responds with success if a user is logged in" do
      perform_login
      
      get current_user_path

      must_respond_with :success
    end

    it "responds with a redirect if no user is logged in" do
      get current_user_path

      must_respond_with :redirect

    end

    it "gets to the current user page" do
      test_user = {
        "user": {
          username: user.username,
        }
      }

      post login_path, params: test_user
      expect(session[:user_id]).must_equal user.id

    end
  end
end
