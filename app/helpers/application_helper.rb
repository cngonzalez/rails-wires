module ApplicationHelper

  def choose_nav(page)
    if page && (params[:action] == "show" || params[:action] == "edit")
      page.elements.where(div: 0).empty? ?  'top_nav' : 'sidebar'
    else 'top_nav'
    end
  end

  def nav_height(page)
    (page.nav if page) || "250px"
  end

  def notify
    if notice || alert
      render 'notifications'
    end
  end


end
