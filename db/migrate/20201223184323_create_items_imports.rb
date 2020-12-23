class CreateItemsImports < ActiveRecord::Migration[6.0]
  def change
    create_table :items_imports do |t|
      t.string :file

      t.timestamps
    end
  end
end
