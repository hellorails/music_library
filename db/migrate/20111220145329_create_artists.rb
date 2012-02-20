class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string  :name
      t.string  :active_users
      t.string  :biography
      

      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
