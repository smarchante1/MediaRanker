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
end
