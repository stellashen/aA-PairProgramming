class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true

  belongs_to :viewer,
    class_name: :User,
    dependent: :destroy

  belongs_to :artwork


end
