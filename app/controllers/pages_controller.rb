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
    @page.build_css
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    page = Page.find(params[:id])
    if page.update(page_params)
      redirect_to page_path(page)
    else redirect_to edit_page_path(page)
    end
  end

  def page_params
    par = params.require(:page).permit(:body_color, :text_color, :accent_color, :name, elements_attributes: [:div, :position, :size])
    par[:elements_attributes].select!{|k, v| v[:div] != 4.to_s}
    par
  end


end
