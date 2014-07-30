require 'prime.rb'

def is_divisible_through(n, k)
    return false if n % 2520 != 0
    (11..k).each do |candidate|
        return false if n % candidate != 0
    end
    return true      
end

candidate = 2520*20 
while(true)
    if( !Prime.prime?(candidate) )
        break if is_divisible_through(candidate, 20)
    end
    candidate += 1
end

puts candidate 
