class ArtistsController < ApplicationController
  layout 'application1'
   before_filter :authorize_access
  
  def index
     @artists = Artist.find(:all)
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(params[:artist])
  if @artist.save
    flash[:notice] = 'Artist Details  successfully created.'
    redirect_to :action=> 'index'
  else
    flash[:notice] = 'Artist Details not created.'
    render :action=> 'new'
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
       flash[:notice] = 'Artist Details was successfully updated.'
       redirect_to :action=> 'index'
 
    else
       flash[:notice] = @artist.errors
       render :action=> 'edit'
   end
   
  end


  def delete
       @artist = Artist.find(params[:id])
      if  @artist.destroy
       flash[:notice] = 'Artist Details was successfully updated.'
       redirect_to :action=> 'index'
     else
       flash[:notice] = 'Artist Details was successfully updated.'
       redirect_to :action=> 'index'
      end
  end
end
