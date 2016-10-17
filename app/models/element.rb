class Element < ApplicationRecord
  belongs_to :page

  def write_block(file)
    File.open(file, 'a') do |f|
      f.puts self.write_type
      f.puts "overflow: hidden;"
      f.puts "max-width: #{write_width}" if self.div != 1
      f.puts "max-height: #{write_height}" if self.div != 0
      f.puts self.border_radius
      f.puts "border: solid #{self.color} 3px;"
      f.puts "background-color: #{self.color};"
      f.puts "}"
      f.puts ""
      if self.div > 1
        f.puts ".#{self.div_type} img {opacity: 0.75;"
        f.puts "object-fit: cover;"
        f.puts "}"
        f.puts ""
      end
    end
  end

  def write_type
    hash = {
      0 => '.element-sidebar {',
      1 => '.navbar-collapse {',
      2 => ".circle-#{self.id} {",
      3 => ".rectangle-#{self.id} {"
    }
    hash[self.div]
  end

  def write_width
    hash = {
      0 => '200px;',
      1 => '400px;',
      2 => '500px;',
      3 => '650px;'
    }
    hash[self.size]
  end

    def write_height
      hash = {
        0 => '200px;',
        1 => '350px;',
        2 => "500px;",
        3 => '650px;'
      }
      self.div == 3 ? hash[(self.size - 1)] : hash[self.size]
    end

    def div_type
      write_type[1..-1].chomp(" {")
    end

    def border_radius
      self.div == 2 ? "border-radius: 50%;" : "border-radius: 3px;"
    end


end
