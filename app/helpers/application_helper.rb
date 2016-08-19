module ApplicationHelper

  def choose_nav(page)
    if !(params[:action] == "index")
      (page && !page.elements.where(div: 0).empty?) ? 'sidebar' : 'top_nav'
    end 
  end

  def nav_height(page)
    (page.nav if page) || "250px"
  end

end
