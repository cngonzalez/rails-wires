class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @page = Page.find(2)
    render 'index'
  end

  def test
  end


end
