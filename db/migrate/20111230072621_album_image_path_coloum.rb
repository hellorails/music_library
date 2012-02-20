class AlbumImagePathColoum < ActiveRecord::Migration
  def self.up
      add_column :albums, :image_path, :string
  end

  def self.down
    remove_coloum :albums, :image_path
  end
end
