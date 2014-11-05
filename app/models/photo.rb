class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :album

  validates :image, presence: true
  validates :tag_line, presence: true
end
