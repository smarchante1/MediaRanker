require "test_helper"

describe Work do
  let(:work) { works(:album_1) }
  let(:user) { users(:one) }

  it "must be valid" do
    value(work).must_be :valid?
  end

  describe "validations" do
    it "must have a title" do
      work.title = nil

      valid_work = work.valid?

      expect(valid_work).must_equal false
      expect(work.errors.messages).must_include :title
      expect(work.errors.messages[:title]).must_equal ["can't be blank"]
    end
  end

  describe "relationships" do
    it "takes votes" do
      work.upvote_by user
      expect(work.cached_votes_total).must_equal 1
      expect(user.voted_for?(work)).must_equal true
    end
  end

  describe "top ten categories" do
    it "will return top ten works  " do
      works = Work.top_ten_categories('album')
      expect(works.length).must_equal 10
    end

  end
end


