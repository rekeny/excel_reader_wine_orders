class AddCourierToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :courier, :string
  end
end
