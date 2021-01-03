class AddCompletedToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :completed, :boolean, default: :false
  end
end
