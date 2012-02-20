class Cart
  attr_reader :items
  attr_reader :total_price
  
  
  def initialize
    empty_all_items
  end
  
  def add_album(album)
     existing_item = @items.find{|item| item.album_id == album.id}
    if existing_item
      existing_item.quantity += 1
    else
      @items << Lineitem.new_based_album(album)
    end
      @total_price += album.price#
  end
  
  
  def remove_album(album)
      existing_item = @items.find{|item| item.album_id == album.id}
   if existing_item &&  existing_item.quantity > 1
      existing_item.quantity -= 1
   else
       @items.delete(existing_item)
   end
       @total_price = @total_price - album.price 
 end
  
  
 def empty_all_items
   @items = []
   @total_price = 0.0 
 end
  
  
end
