class Link < ApplicationRecord
  validates :link_url, presence: true

  def upvote
    increment!(:upvotes)
  end
end
