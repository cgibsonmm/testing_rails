class Link < ApplicationRecord
  validates :link_url, presence: true
end
