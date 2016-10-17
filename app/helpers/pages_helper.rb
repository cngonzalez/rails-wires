
module PagesHelper

def like_box
  (current_user.id == @page.user_id)? 'owner' : 'like_this'
end

def header
  params[:action] == 'new' ? 'Create a page template' : 'Edit this page template'
end

def form_errors(page)
  render('form_errors', page: page) unless page.errors.messages.empty?
end

def error_list(messages)
  render('error_list', messages: messages.delete_if{|k, v| v.nil?}) unless messages.empty?
end


def is_element?(div)
  div.include?("circle") || div.include?("navbar") || div.include?("rectangle") || div.include?("sidebar")
end


def rando_image
  pics = Dir.entries('public/pages/images').select{|filename| filename.length > 3 }
  "images/#{pics.sample}"
end

end
