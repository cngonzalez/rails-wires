
module PagesHelper

def make_rows(page)
  grid = []
  9.times do |i|
    element = page.get_element(i + 1)
    if element && element.div > 1
      grid.push("col-sm-4 #{element.div_type}")
    else grid.push "col-sm-4"
    end
  end
  row_1 = grid[0..2]
  row_2 = grid[3..5]
  row_3 = grid[6..8]
  rows = [row_1, row_2, row_3].map{|row| flatten_row(row)}
end

def flatten_row(row)
  if row[0] == row[1] && row[0] == row[2]
    ["col-sm-12"]
  elsif row[0] == "col-sm-4" && row[1] == "col-sm-4"
    ["col-sm-8", row[2]]
  elsif row[1] == "col-sm-4" && row[2] == "col-sm-4"
    [row[0], "col-sm-8"]
  else row
  end
end

def is_element?(div)
  div.include?("circle") || div.include?("navbar") || div.include?("rectangle") || div.include?("sidebar")
end

def rando_image
  pics = Dir.entries('public/pages/images').select{|filename| filename.length > 3 }
  "images/#{pics.sample}"
  
  #wash color over an image
end



end
