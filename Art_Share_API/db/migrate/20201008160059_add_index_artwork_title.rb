class AddIndexArtworkTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :artworks, :title, unique: true
  end
end
