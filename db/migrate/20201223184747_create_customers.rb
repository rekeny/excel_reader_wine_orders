class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :date
      t.string :order_num
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address1
      t.string :address2
      t.string :postcode
      t.string :town

      t.timestamps
    end
  end
end
