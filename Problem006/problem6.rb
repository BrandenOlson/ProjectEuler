#SOLVED

def sum_to(n)
    n*(n + 1)/2
end

UPPER_BOUND = 100

sum_of_squares = 0
(1..UPPER_BOUND).each do |number|
   sum_of_squares += number ** 2 
end

minuend = sum_to(UPPER_BOUND) ** 2
subtrahend = sum_of_squares
result = minuend - subtrahend

puts result 
