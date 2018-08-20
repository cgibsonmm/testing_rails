class Link < ApplicationRecord
  validates :link_url, presence: true

  def upvote
    increment!(:upvotes)
  end

  def score
    upvotes - downvotes
  end
end
