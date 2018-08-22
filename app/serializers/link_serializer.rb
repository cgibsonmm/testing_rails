class LinkSerializer
  include FastJsonapi::ObjectSerializer
  set_type :link
  attributes :link_title, :link_url, :upvotes, :downvotes
end
