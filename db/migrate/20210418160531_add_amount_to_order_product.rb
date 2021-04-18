class AddAmountToOrderProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :order_products, :amount, :integer
  end
end
