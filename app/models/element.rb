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
      :'small' => 0,
      :'medium' => 1,
      :'large' => 3
    }
  end

  def self.positions
    hash = {}
    9.times{|i| hash[(i + 1).to_s] = i + 1}
    hash
  end


end
