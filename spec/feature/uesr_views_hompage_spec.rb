require 'rails_helper'

RSpec.feature "User view homepage" do
  scenario "they see a nav bar" do
    visit root_path

    expect(page).to have_link "RADDIT"
  end

  scenario "they see existing links" do
    link = create(:link)

    visit root_path

    expect(page).to have_link link.link_title, href: link.link_url
  end
end
