class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.datetime :date
      t.text :content
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
