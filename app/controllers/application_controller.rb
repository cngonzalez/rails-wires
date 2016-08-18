class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    if current_user
      @user = current_user
      render 'home_page'
    else redirect_to new_user_registration_path
    end
  end

  

end
