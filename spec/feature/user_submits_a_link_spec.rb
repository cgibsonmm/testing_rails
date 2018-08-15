require 'rails_helper'

RSpec.feature "User submits a link" do
  scenario "they see the page for the submitted link" do
    link_title = "This Testing Rails book is awesome!"
    link_url = "http://testingrailsbook.com"

    visit root_path
    click_on "Submit a new link"
    fill_in "Link title", with: link_title
    fill_in "Link url", with: link_url
    click_on 'Submit!'

    expect(page).to have_link link_title, href: link_url
  end
end
