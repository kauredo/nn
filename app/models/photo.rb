class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :page

  scope :sort_order, -> {
    where.not(order: nil).order(:order)
  }
end
