class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :first_name
      t.text :last_name
      t.text :address
      t.text :district
      t.text :sub_district
      t.text :province
      t.text :zip_code
      t.float :total_price
      t.text :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
