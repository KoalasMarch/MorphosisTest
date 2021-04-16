class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :title
      t.text :description
      t.float :price
      t.text :sku

      t.timestamps
    end
  end
end
