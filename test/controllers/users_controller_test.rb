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


  describe "vote action" do
    before do
      @work = works(:album_1)
      @user = perform_login
    end
  
    it "user can vote when logged in & voting for the first time" do
      perform_login

      work_1 = works(:book_5)
  
      post vote_path(work_1.id)

      expect(
        work_1.cached_votes_total
      ).must_equal 1
  
    end
  end
  

end
