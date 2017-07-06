class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees, id: false do |t|
      t.string :id, null: false
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.string :phone_number
      t.string :address
      t.integer :role
      t.integer :branch_id

      t.timestamps
    end

    add_index :employees, :id, unique: true
  end
end
