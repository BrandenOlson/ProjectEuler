def filter_evens(list)
    list.keep_if{ |element| element % 2 != 0 }
end

def is_prime(n)
    filter_evens((2..(n-1)).to_a).each do |i|
        if n % i == 0
            return false
        end
    end
    return true
end

def is_factor(x, y)
    return y % x == 0
end

number = 13195 #600851475143 
iteration_max = Math.sqrt(number).floor
max = 0
filter_evens((1..iteration_max).to_a).each do |i|
    if is_prime(i) and is_factor(i, number)
        max = i
    end
end

puts max
