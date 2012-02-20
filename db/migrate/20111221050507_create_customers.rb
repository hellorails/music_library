class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string  :first_name, :null => false
      t.string  :last_name, :null => false
      t.integer :zipcode, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
