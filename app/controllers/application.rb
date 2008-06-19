# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  session :disabled => true
  before_filter :init_base
  
  def init_base
    @base_url=base_url
  end
  
  def hit
    Hit.create(:request=>request)
  end
  
  def authenticate
    if params[:pass] && !params[:pass].empty?
      cookies[:pass]={:value=>params[:pass],:expires=>1.years.from_now}
      redirect_to "/stats"
    else 
      return false unless cookies[:pass]=='ppaa'
      #raise "Not found" unless session[:pass]=='ppaa'
      return true
    end
  end
  
  def base_url
    base = (request.port == "443" || request.port == 443) ? "https://" : "http://"
    base += "#{request.host}"
    base+=":#{request.port}" unless request.port == "80" || request.port == 80 || request.port == "443" || request.port == 443
    base
  end
end