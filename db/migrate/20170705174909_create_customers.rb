class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers, id: false do |t|
      t.string :id, null: false
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.string :phone_number
      t.string :address
      t.integer :point, default: 0
      t.integer :level
      t.integer :branch_id

      t.timestamps
    end

    add_index :customers, :id, unique: true
  end
end
