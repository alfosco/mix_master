require 'rails_helper'

RSpec.feature "User navigates to artists index page" do
  scenario "they see a list of all artists currently in the db" do
    artist_1 = Artist.create(name: "Old Dirty Bastard", image_path: "http://www.sosoactive.com/wp-content/uploads/2013/11/ODB5.jpg")
    artist_2 = Artist.create(name: "Juicy J", image_path: "http://conversationsabouther.net/wp-content/uploads/2015/06/Juicy-j-cup-1.png")
    artist_3 = Artist.create(name: "Eazy E", image_path: "http://www.billboard.com/files/media/Eazy-E-1990-billboard-650.jpg")

    visit artists_path

    expect(page).to have_link artist_1.name, href: artist_path(artist_1)
    expect(page).to have_link artist_2.name, href: artist_path(artist_2)
    expect(page).to have_link artist_3.name, href: artist_path(artist_3)
  end
end