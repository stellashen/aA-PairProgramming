class ArtWork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id,
    message: "should only have one piece with this name for the same artist"  }

  belongs_to :artist,
    class_name: :User

  has_many :artwork_shares,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
end
