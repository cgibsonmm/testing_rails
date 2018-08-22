require 'rails_helper'

RSpec.describe Link, "#upvote" do
  it "increments upvotes" do
    link = build(:link, upvotes: 1)

    link.upvote

    expect(link.upvotes).to eq 2
  end
end

RSpec.describe Link, "#score" do
  it "returns the upvotes minus the downvotes" do
    link = Link.new(upvotes: 2, downvotes: 1)

    expect(link.score).to eq 1
  end
end


RSpec.describe Link, ".hottest_first" do
  it "returns an array orderd form highest likes to lowest" do
    coldest_link = create(:link, upvotes: 3, downvotes: 1, link_url: 'www.hello.com')

    hottest_link = create(:link, upvotes: 5, downvotes: 1, link_url: 'www.yes.com')

    lukewarm_link = create(:link, upvotes: 4, downvotes: 1, link_url: 'www.bye.com')

    default_link = create(:link, link_url: 'www.default.com')

    expect(Link.hottest_first).to eq [hottest_link, lukewarm_link, coldest_link, default_link]
  end
end

RSpec.describe Link, "validations" do
  it { is_expected.to validate_presence_of(:link_title) }
  it { is_expected.to validate_presence_of(:link_url) }
  it { is_expected.to validate_uniqueness_of(:link_url) }
end
