class CreateProductSets < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sets do |t|
      t.references :product, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
