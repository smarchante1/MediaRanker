class User < ApplicationRecord
  validates :username, presence: true
  acts_as_voter
end
