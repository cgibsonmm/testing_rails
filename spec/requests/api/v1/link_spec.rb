require 'rails_helper'

RSpec.describe "GET /api/v1/links" do
  it 'returns a list of all the links, hottest first' do
    colldest_link = create(:link)
    hottest_link = create(:link, link_url: 'www.hello.com', upvotes: 10)

    get '/api/v1/links.json'

    expect(json_body['data'].count).to eq(2)

    hottest_link_json = json_body['data'][0]
    expect(hottest_link_json).to eq({
      "id" => hottest_link.id.to_s,
      "type" => 'link',
      "attributes" => {
        "downvotes" => 0,
        "link_title" => hottest_link.link_title,
        "link_url" => hottest_link.link_url,
        "upvotes" => 10,
      },
    })
  end
end
