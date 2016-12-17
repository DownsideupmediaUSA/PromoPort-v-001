module ArtistsHelper
  def display_artist(song)
    link_to song.artist.artist_name, artist_path(song.artist)
  end
end
