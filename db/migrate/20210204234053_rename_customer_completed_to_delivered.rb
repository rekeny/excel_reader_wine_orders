class RenameCustomerCompletedToDelivered < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :completed, :delivered

  end
end
