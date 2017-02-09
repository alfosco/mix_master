require 'rails_helper'

RSpec.feature "User navigates to playlist index page" do
  scenario "they see all playlists" do
      playlists = create_list(:playlist_with_songs, 2)

      visit playlists_path

    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
    
  end
end