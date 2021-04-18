# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  address      :text
#  district     :text
#  first_name   :text
#  last_name    :text
#  province     :text
#  status       :text
#  sub_district :text
#  total_price  :float
#  zip_code     :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  before_validation :calculate_price

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :province, presence: true
  validates :sub_district, presence: true
  validates :district, presence: true
  validates :zip_code, presence: true
  validates :price, presence: true

  def calculate_price 
    products.sum(&:price)
  end

  def create_order_producrs(details)
    results = []
    details.each do |detail|
      product = Product.find(product[:id])
      if product.stock.stock_number >= product[:amount]
        OrderProduct.create(order_id: id, product_id: product[:id], amount: product[:amount]) 
        remain = product.stock.stock_number - product[:amount]
        product.stock.update(stock_number: remain)
        results << "#{product.title} was successfully added"
      else
        results << "#{product.title} out of stock"
      end
    end

    results
  end
end
