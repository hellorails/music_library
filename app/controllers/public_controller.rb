class PublicController < ApplicationController
  
  before_filter :find_or_create ,:except => [:list]
  
  def list
    @albums = Album.paginate(:page => params[:page], :per_page => 3)
  end
  
  def add_to_cart
    album = Album.find(params[:id])
    @cart.add_album( album )
    redirect_to(:action => 'show_cart')
  end

  def remove_from_cart
   album = Album.find(params[:id])
   @cart.remove_album(album)
   flash[:notice] = 'One item was Removed from the cart'
   redirect_to(:action => 'show_cart')
  end
 
 
 
  def show_cart
  end

  def check_out
    
  end
  
  def save_order
    @customer = Customer.new(params[:customer])
    credit_card_number = params[:credit_card]
    @order = Order.new
    @order.lineitems << @cart.items
    @customer.orders << @order
    
    if @customer.save
  #payment
  #fails fix page
     redirect_to(:action => 'show_receipt',:id => @order.id)
    else
      flash[:notice] = 'Verify mandatory Details'
      render(:action=>'checkout')
    end  

  end






  def empty_cart
    @cart.empty_all_items
    flash[:notice] = "Your cart is now empty"
    redirect_to(:action => 'list')
  end


private #-----------------------------


def find_or_create
  @cart = session[:cart] ||= Cart.new
end
end
