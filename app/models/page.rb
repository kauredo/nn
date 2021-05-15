class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :photos, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :image_height, presence: true
  validates :image_width, presence: true
  validates :number_rows_desktop, presence: true
  validates :number_rows_mobile, presence: true

  scope :sort_order, -> {
    where.not(order: nil).order(:order)
  }

  def main_photo
    photos.where(main: true).first
  end
end
