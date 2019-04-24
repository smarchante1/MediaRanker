require "test_helper"

describe User do
  let(:user) { users(:two)}

  it "must be valid" do
    is_valid = user.valid?
    value(is_valid).must_equal true
  end
end
