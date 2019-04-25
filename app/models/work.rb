class Work < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :creator, :category, :description, :pub_year, presence: true

  acts_as_votable

  def top_work


  end
end
