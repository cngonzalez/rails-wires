class Page < ApplicationRecord
  has_many :likes
  has_many :likers, through: :likes, source: :user
  has_many :elements

  #validates for validity -- nothing in position one, nothing in the same place, must have name

  def elements_attributes=(hash)
    hash.each do |k, v|
      element = self.elements.build(v)
      element.color = self.accent_color
    end
  end

  def build_css
    directory_name = Dir.pwd + "/public/stylesheets/users/#{self.user_id}"
    Dir.mkdir(directory_name) if !Dir.exist?(directory_name)
    file = File.open("#{directory_name}/#{self.id}.css", 'w')
    self.elements.each_with_object(file){ |el, file| el.write_block(file) }
    body_elements(file)
    self.update(filepath: "users/#{self.user_id}/#{self.id}.css")
  end

  def get_element(index)
    self.elements.where(position: index).first
  end

  def nav
    nav = self.elements.where(div: 1).first
    nav.write_height.chomp(";")
  end

  def body_elements(file)
    File.open(file, 'a') do |f|
      f.puts "body {"
      f.puts "background: #{self.body_color};"
      f.puts "}"
      f.puts ".test-page {color: #{self.text_color}}"
      f.puts " "
    end
  end

  def not_authorized(user)
     if !(user.id == self.user_id)
      flash[:alert] = "You're not authorized to edit this page."
    end
    !(user.id == self.user_id)
  end

  def destroy
    super
    path = Dir.pwd + "/public/stylesheets/#{self.filepath}"
    File.delete(path)
  end




end
