#SOLVED

f1 = 1
f2 = 2
f3 = f1 + f2
sum = f2 
while( f3 <= 4000000 )
    f1 = f2
    f2 = f3
    f3 = f1 + f2
    if( f3 % 2 == 0 )
        sum += f3
    end
end 

puts sum
