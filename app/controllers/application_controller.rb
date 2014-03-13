class ApplicationController < ActionController::Base
  
	include Pundit
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception 

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :page_not_found

  private

  def page_not_found
  	
    render  'errors/404'
  end


  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
    # lo redirecciono a donde venía o si no a la raiz
  end

  
end
