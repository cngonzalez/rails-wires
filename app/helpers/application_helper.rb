module ApplicationHelper

  def choose_nav(page)
    (page && !page.elements.where(div: 0).empty?) ? 'sidebar' : 'top_nav'
  end

  def nav_height(page)
    (page.nav if page) || "250px"
  end

end
