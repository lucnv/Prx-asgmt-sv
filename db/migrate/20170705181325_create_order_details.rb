class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details, id: false do |t|
      t.string :id, null: false
      t.string :order_id
      t.integer :product_id
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end

    add_index :order_details, :id, unique: true
  end
end
