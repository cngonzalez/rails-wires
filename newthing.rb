def matcher(str)
  chars = str.split("")
  # ["(", ")"]
  chars.each_with_index do |char, i|
    if char == ")"
      return false
    else
      match_i = chars.index(")")
      if match_i
        chars[i] = nil
        chars[match_i] = nil
      end 
    end
  end
  if chars.reject{|x| x == nil}.length > 0
    return false
  else return true
  end  
end

# def correct_way(str)
#   chars = str.split("")
#   chars.reduce([], char) do 
#   end
# end

def kk(string)
  arr = ['a']
  l = string.length
  i = 0
  while i < l
    if string[i] == '('
      arr.push(string[i])
    end
    if string[i] == ')'
      arr.pop
    end
    i+=1
  end
  return arr.length == 1
end

c_start = Time.now
1000.times do 
  matcher('((()))')
  matcher('(()')
end 
c_time = Time.now - c_start

w_start = Time.now
1000.times do
  kk('((()))')
  kk('(()')
end

w_time = Time.now - w_start

puts c_time
puts w_time
