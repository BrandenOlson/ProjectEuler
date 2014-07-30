#SOLVED

def find_product
    for c in (1..1000)
        puts c
        for b in (1..c)
            for a in (1..b)
                lhs = a*a + b*b
                rhs = c*c
                if lhs == rhs and 1000 == a + b + c 
                    puts "a = #{a}; b = #{b}; c = #{c}" # out of curiosity
                   return a*b*c
                end
            end
        end
    end
    return -1
end

puts find_product
