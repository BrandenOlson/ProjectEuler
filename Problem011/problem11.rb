#SOLVED

filename = 'numbers.txt'

file = File.new(filename)
lines = [];
file.each_line do |line|
    lines.push(line.split(' ').to_a)
end

WIDTH = lines.length
HEIGHT = lines[0].length 

number_list = Hash.new
(1..HEIGHT).each do |i|
    (1..WIDTH).each do |j|
        number_list[[i,j]] = lines[i-1][j-1].to_i
    end
end

# At this point, the matrix has been populated and stored (in a hash)
# Next, we exhaust all possible sequences of 4 numbers

def get_max_product(matrix, direction)
    max = 0
    (1..WIDTH).each do |j|
        (1..(HEIGHT-4)).each do |i|
            product = 1
            (0..3).each do |offset|
                i_index = 0;
                j_index = 0;
                if "horizontal" == direction
                   i_index = i + offset
                   j_index = j
                elsif "vertical" == direction
                   i_index = i
                   j_index = j + offset
                elsif "left diagonal" == direction
                   i_index = i + offset
                   j_index = j + offset
                elsif "right diagonal" == direction
                   i_index = i + offset
                   j_index = j - offset
                end
                value = matrix[[i_index, j_index]]
                if "Fixnum" == value.class.to_s
                   product *= value   
                end
            end 
            if product > max
                max = product
            end
        end
    end
    max
end


max_horizontal = get_max_product(number_list, "horizontal")
max_vertical = get_max_product(number_list, "vertical")
max_left_diagonal = get_max_product(number_list, "left diagonal")
max_right_diagonal = get_max_product(number_list, 
   "right diagonal")

result = [max_horizontal, max_vertical, max_left_diagonal, 
            max_right_diagonal].max

puts result
