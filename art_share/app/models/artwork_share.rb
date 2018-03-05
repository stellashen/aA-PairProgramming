class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true

  belongs_to :viewer,
    class_name: :User

  belongs_to :artwork,
    class_name: :ArtWork


end
