# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  #Fonction set_current_user
  private
  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      redirect_to "/users/login"
    end
  end

  def set_categories
    @categories = Category.all
  end

end
