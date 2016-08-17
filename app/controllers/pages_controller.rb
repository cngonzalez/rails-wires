class PagesController < ApplicationController

  def new
    @page = Page.new
    @page.elements.build(div: 0)
    @page.elements.build(div: 3)
    @page.elements.build(div: 3)
  end

  def create
    byebug
    Page.create(page_params)
  end

  def page_params
    par = params.require(:page).permit(:body_color, elements_attributes: [:div, :position, :color, :size])
    par[:elements_attributes].keep_if{|k, v| v[:color] != ""}
    par
  end


end
