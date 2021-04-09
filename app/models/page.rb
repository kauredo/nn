class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :photos

  def main_photo
    photos.where(main: true).first
  end
end
