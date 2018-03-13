class AddIndexToArtwork < ActiveRecord::Migration[5.1]
  def change
    add_index :art_works, [:artist_id, :title]
    add_index :art_works, :artist_id
  end
end
