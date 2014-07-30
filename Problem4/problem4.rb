#SOLVED

def is_palindrome(n)
    n_as_string = n.to_s
    return n_as_string == n_as_string.reverse
end

max = 0
for i in 100...999
    for j in 100..999
        candidate = i*j
        if is_palindrome( candidate ) and candidate > max
            max = candidate
        end
    end
end

puts max 
