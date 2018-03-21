class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true

  belongs_to :viewer,
    class_name: :User,
    foreign_key: :viewer_id,
    primary_key: :id,
    dependent: :destroy

  belongs_to :art_work,
    class_name: :ArtWork,
    foreign_key: :artwork_id,
    primary_key: :id


end
