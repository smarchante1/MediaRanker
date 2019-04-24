require "test_helper"

describe WorksController do
  let(:work) { works(:book) }
  let(:work_2) { works(:album) }

  describe "index action" do
    it "will show works index page" do
      get works_path

      must_respond_with :success
    end
  end

  describe "show action" do
    it "shows a details page for an existing work" do 
      get work_path(work.id)

      must_respond_with :success
    end

    it "redirects if given invalid id" do
      get work_path(-1)

      must_respond_with :redirect
      must_redirect_to root_path
      expect(flash[:failure]).must_equal "Your search returned no results."
    end
  end

  describe "new" do
    it ""


  end
end
