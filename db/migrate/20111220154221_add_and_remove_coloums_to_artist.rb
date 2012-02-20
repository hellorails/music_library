class AddAndRemoveColoumsToArtist < ActiveRecord::Migration
  def self.up
       add_column :albums, :artist_id, :integer 
  end

  def self.down
     remove_column :albums, :artist_id
     remove_column :albums, :artist 

  end
end
