# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  price       :float
#  sku         :text
#  title       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  has_many :product_orders
  has_many :orders, through: :product_orders
  has_many :product_sets
  has_one :stock
  has_one_attached :image

  validates :title, presence: true
  validates :price, presence: true

  def image_url
    Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
  end
end
