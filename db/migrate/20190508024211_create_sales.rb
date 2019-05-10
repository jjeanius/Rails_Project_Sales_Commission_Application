class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :region
      t.integer :employee_id
      t.integer :product_id
      t.integer :quantity
      t.integer :commission_rate
      t.integer :commission_amount

      t.timestamps
    end
  end
end