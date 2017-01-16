class Song < ApplicationRecord
  belongs_to :genre
  belongs_to :artist
  has_many :song_releases
  has_many :releases, through: :song_releases
  has_many :comments
  has_many :users, through: :comments
  has_attached_file :image, styles: { large: "1400x1400>", medium: "600x600>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def releases_attributes=(release_attributes)
    release_attributes.values.each do |release_attribute|
      release = Release.find_or_create_by(release_attribute)
      self.releases.build(release_attributes)
    end
  end



end
