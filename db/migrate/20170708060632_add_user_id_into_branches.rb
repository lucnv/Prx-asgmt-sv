class AddUserIdIntoBranches < ActiveRecord::Migration[5.0]
  def change
    add_column :branches, :user_id, :integer
  end
end
