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
    it "gets to the new page" do
      get new_work_path

      must_respond_with :success
    end
  end

  describe "create" do
    it "successfully creates a new media" do 
      media_params = {
        "work": {
          category: "book",
          title: "1984",
          creator: "George Orwell",
          pub_year: 1948,
          description: "A startling and haunting vision of the world, 1984 is so powerful that it is completely convincing from start to finish"
        }
      }

      expect {
        post works_path, params: media_params
      }.must_change "Work.count", 1

      must_respond_with :redirect
      new_media = Work.find_by(title: media_params[:work][:title])
      expect(flash[:success]).must_equal  "#{new_media.title} was successfully created."
      must_redirect_to work_path(new_media.id)
    end
  end
end
