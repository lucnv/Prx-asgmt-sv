class CreateBranchProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :branch_products do |t|
      t.integer :branch_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end

    add_index :branch_products, [:branch_id, :product_id], unique: true
  end
end
