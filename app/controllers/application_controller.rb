class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'splash', only: [:index]


  def index
    if current_user
      @user = current_user
      redirect_to user_path(@user)
    else render 'index'
    end
  end



end
