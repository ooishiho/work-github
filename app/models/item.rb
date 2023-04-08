class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  has_one_attached :image

  def get_item_image(width,height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_square.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    item_image.variant(resize_to_limit: [width,height]).processed
  end
end
