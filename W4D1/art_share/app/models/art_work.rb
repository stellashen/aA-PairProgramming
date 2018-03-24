class ArtWork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id,
    message: "should only have one piece with this name for the same artist"  }

  belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id,
    primary_key: :id,
    dependent: :destroy

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  def self.artworks_for_user_id(user_id)
  ArtWork
    .left_outer_joins(:artwork_shares)
    .where('(art_works.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
    .distinct
  end
end
