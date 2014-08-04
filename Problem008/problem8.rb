#SOLVED

file = File.open("numbers.txt")

numbers = []
file.each_char do |char|
    numbers.push(char) unless "\n" == char 
end

def pop_first(array)
    return array.delete_at(0)
end

max = 0;
digit_count = 13;

while digit_count <= numbers.length
    product = 1
    numbers.first(digit_count).each do |number|
        product *= number.to_i
    end
    if product > max
        max = product
    end    
    pop_first(numbers)
end

puts max

