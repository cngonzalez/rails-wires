class PagesController < ApplicationController
  before_action :require_login

  def new
    @page = Page.new
    @page.elements.build(div: 1)
    @page.elements.build(div: 4)
    @page.elements.build(div: 4)
  end

  def create
    @page = Page.new(page_params)
    @page.user_id = current_user.id
    if @page.valid?
      @page.save
      redirect_to page_path(@page)
    else render 'new'
    end
  end

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    @page.build_css
  end

  def edit
    @page = Page.find(params[:id])
    @page.more_elements
    if @page.not_authorized?(current_user)
      flash[:alert] = "You're not authorized to edit this page."
      redirect_to page_path(@page) if @page.not_authorized(current_user)
    end
  end

  def update
    @page = Page.find(params[:id])
    @page.rebuild
    @page.update(page_params)
    if @page.valid?
      redirect_to page_path(@page)
    else render 'edit'
    end
  end

  def page_params
    par = params.require(:page).permit(:body_color, :text_color, :accent_color, :name, elements_attributes: [:div, :position, :size])
    par[:elements_attributes].select!{|k, v| v[:div] != 4.to_s}
    par
  end

  def destroy
    page = Page.find(params[:id])
    redirect_to pages_path if page.not_authorized(current_user)
    page.destroy
    flash[:notice] = "Page successfully deleted"
    redirect_to user_path(current_user)
  end

  private
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path
    end
  end


end
