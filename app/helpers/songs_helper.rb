module SongsHelper
  def display_song(artist)
    link_to artist.song.title, song_path(artist.song)
  end
end
