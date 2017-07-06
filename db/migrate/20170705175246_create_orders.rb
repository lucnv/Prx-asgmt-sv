class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders, id: false do |t|
      t.string :id, null: false
      t.string :customer_id
      t.string :employee_id
      t.datetime :time
      t.float :total_price
      t.integer :branch_id

      t.timestamps
    end

    add_index :orders, :id, unique: true
  end
end
