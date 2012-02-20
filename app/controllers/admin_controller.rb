class AdminController < ApplicationController
  
   before_filter :authorize_access , :except => [:index ,:login, :send_login]  
 layout 'application1'
  
  def index
   redirect_to  :action => 'login'
  end
  
  def menu
 
  end
  
  def login
    @user = User.new
  end
  
  def send_login
    @user = User.new(params[:admin])
    
 #   raise @user.inspect
    logged_in_user = @user.try_to_login
    if logged_in_user
      session[:user_id] = logged_in_user.id
      flash[:notice] = "You are now Logged in"
      redirect_to :action => 'menu'
    else
      flash[:notice] = "Incorrect Username and password"
      redirect_to :action => 'login'
    end
  end
  
  
  def logout
    session[:user_id] = nil
     flash[:notice] = "you are Logged out sucessfully"
     redirect_to :action => 'login'
  end
  
 
end
