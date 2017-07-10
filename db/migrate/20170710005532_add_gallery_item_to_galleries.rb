class AddGalleryItemToGalleries < ActiveRecord::Migration[5.1]
  def change
    add_column :galleries, :gallery_item, :string
  end
end
