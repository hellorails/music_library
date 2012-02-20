class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :invoice_number
      t.date :created_on

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
