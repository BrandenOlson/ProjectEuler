# SOLVED!

def is_multiple_of(x, y)
   x % y == 0
end 

sum = 0
(1..999).each do |number|
    if( is_multiple_of(number, 3) || is_multiple_of(number, 5) )
      sum += number  
    end
end

puts sum
