class SongRelease < ApplicationRecord
  belongs_to :song
  belongs_to :release

end
