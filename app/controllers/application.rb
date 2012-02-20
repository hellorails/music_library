# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base  
  helper :all # include all helpers, all the time  
#    before_filter :authorize_access 
  
  layout 'application1'
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '88a23e7eb98b538497533b38ffe13b34'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
   private #-----------------------
  
  
  def authorize_access
   if not session[:user_id]
      flash[:notice] = "please Login"
      redirect_to(:controller => 'admin', :action => 'login')
      return  false
   end  
 end
end
