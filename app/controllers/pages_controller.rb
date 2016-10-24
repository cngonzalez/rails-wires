class PagesController < ApplicationController
  before_action :require_login
  layout 'new', only: [:new, :edit]

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
      render json: @page.to_json, status: 200
    else
      render plain: @page.errors.full_messages.join("\n"), status: 422
    end
  end

  def index
  end

  def test
    @page = Page.find(11)
    render 'show'
  end

  def all
    @pages = Page.all
    render json: @pages.to_json(:include => :user), status: 200
  end

  def show
    @page = Page.find(params[:id])
    respond_to do |format|
      format.html{
        @page.build_css
        render :show
      }
      format.json {render json: @page.to_json(:include => :elements), status: 200}
    end
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

  def destroy
    page = Page.find(params[:id])
    redirect_to pages_path if page.not_authorized?(current_user)
    page.destroy
    flash[:notice] = "Page successfully deleted"
    redirect_to user_path(current_user)
  end


  def page_html
    page = Page.find(params[:id])
    str = ""
    page.make_rows.each do |row|
    str = str + "<div class='row test-page'>"
      row.each do |div|
        str = str + "<div class='#{div}'>"
        if is_element?(div)
          str = str + "<div class='centering-container'>"
          str = str + "<img src=#{rando_image} />"
          str = str = str + "</div>"
        else 
          str = str + "<h3>#{ Faker::Lorem.sentence }</h3><br>"
          str = str + "<p>#{ Faker::Lorem.paragraph(10) }</p>"
        end
        str = str + "</div>"
      end
      str = str + "</div>"
    end
    render html: str.html_safe
  end

  private
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section."
      redirect_to new_user_session_path
    end
  end

  def page_params
    par = params.require(:page).permit(:body_color, :text_color, :accent_color, :name, elements_attributes: [:div, :position, :size])
    par[:elements_attributes].select!{|k, v| v[:div] != 4.to_s}
    par
  end



def is_element?(div)
  div.include?("circle") || div.include?("navbar") || div.include?("rectangle") || div.include?("sidebar")
end


def rando_image
  pics = Dir.entries('public/pages/images').select{|filename| filename.length > 3 }
  "images/#{pics.sample}"
end

end
