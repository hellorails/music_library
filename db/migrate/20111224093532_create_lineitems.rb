class CreateLineitems < ActiveRecord::Migration
  def self.up
    create_table :lineitems do |t|
      t.integer :order_id
      t.integer :album_id
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :lineitems
  end
end
