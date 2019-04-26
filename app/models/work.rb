class Work < ApplicationRecord
  validates :title, presence: true
  acts_as_votable

  def self.works_categories(category)
    return list = Work.where(category: category)
  end

  def top_ten_categories
    works = self.works_categories(category)
    works = works.sort_by {|work| work.order(:cached_votes_total => :desc) }.reverse!
    return works[0..9]
  end

  def self.spotlight
    
  

  end


end
