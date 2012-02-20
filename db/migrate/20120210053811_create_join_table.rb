class CreateJoinTable < ActiveRecord::Migration
 def self.up
    create_table :albums_features, :id => false do  |t|
     t.integer :album_id
     t.integer :feature_id
      t.timestamps
    end
  end

  def self.down
    drop_table :albums_features
  end

end
