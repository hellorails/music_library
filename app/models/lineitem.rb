class Lineitem < ActiveRecord::Base
  belongs_to :order
  belongs_to :album
  
  def self.new_based_album(album)
    line_item = self.new
    line_item.album = album
    line_item.quantity = 1
    line_item.price = album.price
    return line_item
  end
end
