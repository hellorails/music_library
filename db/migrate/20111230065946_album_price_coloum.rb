class AlbumPriceColoum < ActiveRecord::Migration
  def self.up
       add_column :albums, :price, :float, :default => 0 
    
  end

  def self.down
           remove_column :albums, :price 
  end
end
