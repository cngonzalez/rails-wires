class PagesController < ApplicationController

  def new
    @page = Page.new
    @page.elements.build(div: 0)
    @page.elements.build(div: 3)
    @page.elements.build(div: 3)
  end

  def create
    page = Page.new(page_params)
    page.user_id = current_user.id
    if page.save
      page.build_css
      redirect_to page_path(page)
    end
  end

  def index
    byebug
  end

  def show
    @page = Page.find(params[:id])
  end

  def page_params
    par = params.require(:page).permit(:body_color, :text_color, :accent_color, :name, elements_attributes: [:div, :position, :size])
    par[:elements_attributes].keep_if{|k, v| v[:div] != 4}
    par
  end


end
