class Work < ApplicationRecord
  validates :title, presence: true
  acts_as_votable

  def self.works_categories(category)
    return list = Work.where(category: category)
  end

  def self.top_ten_categories(category)
    works = Work.where(category: category).where.not(cached_votes_total: 0).order(title: :asc)
    works = works.sort_by {|work| work.votes_for.size }.reverse!
    return works[0..9]
  end

  def self.top_work
    top_work = Work.order(cached_votes_total: :desc).first
    top_work
  end


end
