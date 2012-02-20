class AddColoumsToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :tittle, :string
    add_column :albums, :artist, :string
    add_column :albums, :release_date, :date 
    add_column :albums, :genere, :string
    add_column :albums, :feature, :integer 

  end

  def self.down
    remove_column :albums, :tittle
    remove_column :albums, :artist
    remove_column :albums, :release_date
    remove_column :albums, :genere
    remove_column :albums, :feature

  end
end
