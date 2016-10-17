class Page < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :likers, through: :likes, source: :user
  has_many :elements
  validates :name, :accent_color, :elements, presence: true
  validate :unique_positions
  before_destroy :delete_css, :delete_elements
  scope :black, -> {where(body_color: 'black') }

  def unique_positions
    if self.elements.map(&:position).uniq.length < self.elements.length
      errors.add(:elements, "Cannot have two elements in same position")
    end
  end

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
      f.puts "background: #{self.body_color};}"
      f.puts "h3, p, label {color: #{self.text_color};"
      f.puts "text-align: center;"
      f.puts "}"
      f.puts ""
      f.puts "p {font: 14px/1.8 Georgia, serif; }"
      f.puts "h1, h2, h3 {font: 30px/2.5 Open Sans, sans-serif; }" 
      f.puts ".col-sm-4, .col-sm-8, .col-sm-12 {"
      f.puts "position: relative;\nmin-height: 1px;\npadding-left: 15px;\npadding-right: 15px;}"
      f.puts ".row:after {"
      f.puts "clear:both;}"
      f.puts ".row {"
      f.puts "min-height: 400px;}"
    end
  end

  def not_authorized?(user)
     !(user.id == self.user_id)
  end

  def delete_css
    path = Dir.pwd + "/public/stylesheets/#{self.filepath}"
    File.delete(path) if File.exist?(path)
  end

  def delete_elements
    Element.send(:destroy, Element.where(page_id: self.id).pluck(:id))
    Like.send(:destroy, Like.where(page_id: self.id).pluck(:id))
  end

  def rebuild
    self.delete_elements
    self.delete_css
  end

  def more_elements
    to_build = 3 - self.elements.count
    to_build.times{self.elements.build(div: 4)}
  end

  def make_rows
    grid = []
    9.times do |i|
      element = self.get_element(i + 1)
      if element && element.div > 1
        grid.push("col-sm-4 #{element.div_type}")
      else grid.push "col-sm-4"
      end
    end
    row_1 = grid[0..2]
    row_2 = grid[3..5]
    row_3 = grid[6..8]
    [row_1, row_2, row_3].map{|row| flatten_row(row)}
  end


  def flatten_row(row)
    if row[0] == row[1] && row[0] == row[2]
      ["col-sm-12"]
    elsif row[0] ==row[1]
      ["col-sm-8", row[2]]
    elsif row[1] == row[2]
      [row[0], "col-sm-8"]
    else row
    end
  end

end
