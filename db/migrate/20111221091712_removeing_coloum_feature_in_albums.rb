class RemoveingColoumFeatureInAlbums < ActiveRecord::Migration
  def self.up
  end

  def self.down
    remove_coloum :albums ,:feature
  end
end
