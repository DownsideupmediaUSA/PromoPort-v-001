module ReleasesHelper
  def display_release(song)
    song.releases.name
  end
end
