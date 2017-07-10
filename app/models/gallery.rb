class Gallery < ApplicationRecord
  belongs_to :user
  mount_uploader :gallery_item, GalleryItemUploader
end
