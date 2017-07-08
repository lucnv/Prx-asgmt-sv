class CreateSynchronizationLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :synchronization_logs do |t|
      t.integer :branch_id
      t.integer :status
      t.text :content

      t.timestamps
    end
  end
end
