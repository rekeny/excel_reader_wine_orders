class ChangeSomeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :ready, :dispatched
  end
end
