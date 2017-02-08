require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "the selected artist is removed from the list" do
    artist_1 = Artist.create(name: "Old Dirty Bastard", image_path: "http://www.sosoactive.com/wp-content/uploads/2013/11/ODB5.jpg")
    artist_2 = Artist.create(name: "Juicy J", image_path: "http://conversationsabouther.net/wp-content/uploads/2015/06/Juicy-j-cup-1.png")
    artist_3 = Artist.create(name: "Eazy E", image_path: "http://www.billboard.com/files/media/Eazy-E-1990-billboard-650.jpg")

    visit artist_path(artist_1)
    click_on "Delete"

    expect(page).to_not have_content artist_1.name
    expect(page).to_not have_css("img[src=\"#{artist_1.image_path}\"]")
  end
end