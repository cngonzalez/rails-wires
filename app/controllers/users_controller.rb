class UsersController < ApplicationController
  #validate something here

  def show
    @user = User.find(params[:id])
  end

end
