class Link < ApplicationRecord
  validates :link_url, presence: true, uniqueness: true
  validates :link_title, presence: true

  def self.hottest_first
    Link.all.sort_by(&:score).reverse
  end

  def upvote
    increment!(:upvotes)
  end

  def score
    upvotes - downvotes
  end
end
