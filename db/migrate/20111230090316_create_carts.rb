class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      t.integer :album_id
      t.integer :feature_id
      t.timestamps
    end
  end

  def self.down
    drop_table :carts
  end
end
