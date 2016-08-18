class Page < ApplicationRecord
  has_many :likes
  has_many :likers, through: :likes, source: :user
  has_many :elements

  # accepts_nested_attributes_for :elements

  def elements_attributes=(hash)
    hash.each do |k, v|
      element = self.elements.build(v)
      element.color = self.accent_color
    end
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

  def get_element(index)
    element = self.elements.where(position: index).first
    element
  end

  def nav
    nav = self.elements.where(div: 1).first
    nav.write_height.chomp(";")
  end


    # def get_columns
    #   first = [nil, nil, nil]
    #   second = [nil, nil, nil]
    #   third = [nil, nil, nil]
    #   els = self.elements.map(&:position)
    #   row_1 = get_row(els, first, 0)
    #   row_2 = get_row(els, second, 3)
    #   row_3 = get_row(els, third, 6)
    #   byebug
    # end
    #
    # def get_row(els, array, add_on)
    #   array.each_with_index do |position, index|
    #     index += add_on
    #     element = get_element(index + 1)
    #     byebug
    #     if element
    #       array[index] = "col-sm-4 #{element.div_type}"
    #     else array[index] = "col-sm-4"
    #     end
    #   end
    # end
    #
    # def flatten(array)
    #   array.each_with_index do |pos, i|
    #     if array[i] && array[i + 1]
    #       if array[i] == "col-sm-4" && array[i] == "col-sm-4"
    #         array.delete_at(i + 1)
    #         array[i] == "col-sm-8"
    #       end
    #     end
    #   end
    # end



end
