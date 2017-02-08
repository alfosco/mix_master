require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they see the updated information" do
    artist = Artist.create(name: "Bruce Springsteen", image_path: "http://assets.nydailynews.com/polopoly_fs/1.1811722.1443029720!/img/httpImage/image.jpg_gen/derivatives/gallery_1200/bruce-springsteen-1985.jpg")
    new_name = "The Boss"

    visit artist_path(artist)
    click_on "Edit"
    fill_in "artist_name", with: new_name
    click_on "Update Artist"

    expect(page).to have_content new_name
    expect(page).not_to have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end