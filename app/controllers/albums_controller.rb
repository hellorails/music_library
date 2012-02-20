class AlbumsController < ApplicationController
   
   before_filter :authorize_access
   
  def index
  #  @albums = Album.find(:all)
    @albums = Album.order_by.paginate(:page => params[:page], :per_page => 7)
  end

  def show
    @album = Album.find(params[:id])

  end


  def new
    @album = Album.new
    @features = Feature.find(:all)

  end


  def edit
    @album = Album.find(params[:id])
    @features = Feature.find(:all)
  end

 
  def create
       @album = Album.new(params[:album])
       @features = Feature.find(:all)
#calling method album_features_id
      checked_features = check_features_using(params[:feature_list])
      uncheck_missing_features(@features,checked_features)
    if @album.save
       flash[:notice] = 'Album was successfully created.'
       redirect_to :action=> 'index'
    else
      flash[:notice] = 'Album Details not created.'
      render :action=> 'new' ,:xml => @album.errors
    end
 
  end

    def update
         @album = Album.find(params[:id])
      if @album.update_attributes(params[:album])
         @features = Feature.find(:all)
         #calling method album_features_id
         checked_features = check_features_using(params[:feature_list])
         uncheck_missing_features(@features,checked_features)
         flash[:notice] = 'Album Details was successfully updated.'
         redirect_to :action=> 'index'
      else
         flash[:notice] = @Album.errors
         render :action=> 'edit'
      end
  end

   def delete
        @album = Album.find(params[:id])
      if  @album.destroy
       flash[:notice] = 'Album Details was successfully updated.'
       redirect_to :action=> 'index'
     else
       flash[:notice] = 'Album Details was successfully updated.'
       redirect_to :action=> 'index'
      end
  end

#***** Private Method ************

private
    
   def check_features_using(feature_id_array)
         checked_features = []
         checked_params  =  params[:feature_list] || []
         for check_box_id in  checked_params
           feature = Feature.find(check_box_id)
           
           if not @album.features.include?(feature) 
             @album.features << feature
           end
           checked_features << feature
         end
       return checked_features
   end

    def  uncheck_missing_features(features,checked_features)
      missing_features = @features - checked_features
       
       for feature in missing_features
         if  @album.features.include?(feature)
          @album.features.delete(feature)
         end
       end
    end  
    
    def album_fatures_id   

         checked_features = []
         checked_params  =  params[:feature_list] || []
         for check_box_id in  checked_params
           feature = Feature.find(check_box_id)
           if not @album.features.include?(feature)
             @album.features << feature
           end
           checked_features << feature
        end
         
         
       missing_features = @features - checked_features
       
       for feature in missing_features
         if  @album.features.include?(feature)
         @album.features << feature
         end
         @album.features.delete(feature)
       end

    end 
end
