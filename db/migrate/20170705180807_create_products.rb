class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.integer :category_id
      t.float :price

      t.timestamps
    end
  end
end
