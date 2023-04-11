class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  has_one_attached :image

  def with_tax_price
    (price * 1.1).floor
  end

  def get_item_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_square.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize_to_limit: [width,height]).processed
  end
end