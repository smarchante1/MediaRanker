class Work < ApplicationRecord
  validates :title, presence: true
  acts_as_votable

end
