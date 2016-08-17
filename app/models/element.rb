class Element < ApplicationRecord
  belongs_to :page

  def self.div_types
    hash = {
      :'navigation bar - left side' => 0,
      :'navigation bar - top' => 1,
      :'image - circle' => 2,
      :'image - rectangle' => 3
    }
  end

  def self.sizes
    hash = {
      :'small' => 1,
      :'medium' => 2,
      :'large' => 3
    }
  end

  def self.positions
    hash = {}
    9.times{|i| hash[(i + 1).to_s] = i + 1}
    hash
  end

  def write_block(file)
    File.open(file, 'a') do |f|
      f.puts self.write_type
      f.puts write_width if self.div != 1
      f.puts write_height if self.div != 0
      f.puts "border-radius: 50%;" if self.div == 2
      f.puts "background-color: #{self.color};"
      f.puts "}"
      f.puts ""
    end
  end

  def write_type
    hash = {
      0 => '#element-sidebar {',
      1 => '.navbar-collapse {',
      2 => "#circle-#{self.id} {",
      3 => "#rectangle-#{self.id} {"
    }
    hash[self.div]
  end

  def write_width
    hash = {
      0 => 'max-width: 200px;',
      1 => 'max-width: 400px;',
      2 => 'max-width: 500px;'
    }
    hash[self.size]
  end

    def write_height
      hash = {
        0 => 'max-height: 200px;',
        1 => 'max-height: 350px;',
        2 => "max-height: 500px;",
        3 => 'max-height: 650px;'
      }
      if self.div == 3
        hash[(self.size - 1)]
      else hash[self.size]
      end
    end

    def div_type
      write_type[1..-1].chomp(" {")
    end






end
