require "test_helper"
require 'pry'

describe VotesController do
  before do
    @work = works(:album_1)
    @user = perform_login
  end

  it "user can vote when logged in & voting for the first time" do
    expect {
      post work_votes_path(@work)
    }.must_change "Vote.count", 1

  end
end
