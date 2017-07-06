class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :working_time

      t.timestamps
    end
  end
end
