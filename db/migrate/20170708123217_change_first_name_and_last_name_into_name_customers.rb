class ChangeFirstNameAndLastNameIntoNameCustomers < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :first_name
    remove_column :customers, :last_name
    add_column :customers, :name, :string
  end
end
