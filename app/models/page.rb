class Page < ApplicationRecord
  has_many :likes
  has_many :likers, through: :likes, source: :user
  has_many :elements

  # accepts_nested_attributes_for :elements

  def elements_attributes=(hash)
    hash.each{|k, v| self.elements.build(v)}
  end

  def build_css
    directory_name = Dir.pwd + "/public/stylesheets/users/#{self.user_id}"
    Dir.mkdir(directory_name) if !Dir.exist?(directory_name)
    file = File.open("#{directory_name}/#{self.id}.css", 'w+')
    self.elements.each_with_object(file){ |el, file| el.write_block(file) }
    File.open(file, 'a') do |f|
      f.puts "body {"
      f.puts "background: #{self.body_color};"
      f.puts "}"
      f.puts " "
    end
    self.update(filepath: "users/#{self.user_id}/#{self.id}.css")
  end



end
