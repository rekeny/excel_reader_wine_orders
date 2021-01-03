class AddReadyToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :ready, :boolean, default: :false
  end
end
