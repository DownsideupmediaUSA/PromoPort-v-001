class SongRelease < ActiveRecord::Base
  belongs_to :song
  belongs_to :release

end
