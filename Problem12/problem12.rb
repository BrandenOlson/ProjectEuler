require 'prime.rb'

def is_divisor(k, n)
    return n % k == 0
end

def remove_odds(array)
    return array.delete_if { |number| number % 2 != 0 }
end

def divisor_count(n)
    return 2 if Prime.prime?(n)
    count = 2 
    (2..(n/2).ceil).each do |candidate|
        if is_divisor(n, candidate) 
            count += 1
        end
    end
    return count
end 

i = 1 
current_triangle_number = i
divisors = 1  

desired_divisor_count = 5 
while( divisors <= desired_divisor_count )
    i += 1 
    current_triangle_number += i
    if current_triangle_number % 2 == 0 
        divisors = divisor_count(current_triangle_number)
    end
end

puts current_triangle_number
