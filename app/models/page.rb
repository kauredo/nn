class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :photos, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :image_height, presence: true
  validates :image_width, presence: true
  validates :number_rows_desktop, presence: true
  validates :number_rows_mobile, presence: true
  after_save :update_orders

  scope :with_order_above, ->(new_order) { where.not(order: nil).where(order: new_order..) }
  scope :sort_order, -> {
    where.not(order: nil).order(:order)
  }

  def main_photo
    photos.where(main: true).first
  end

  private

  def update_orders
    return unless saved_change_to_order? && Page.where(order: order).count > 1

    pages = Page.with_order_above(order)
    pages.each do |page|
      page.update(order: page.order + 1) if page != self && Page.where(order: page.order).count > 1
    end
  end
end
