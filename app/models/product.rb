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
end
