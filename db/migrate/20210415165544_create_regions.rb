class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.text :title
      t.text :country_details
      t.text :currency_details
      t.text :tax_details
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
