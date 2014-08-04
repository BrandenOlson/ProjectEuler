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

def get_max_horizontal_product(matrix)
    max = 0
    (1..WIDTH).each do |j|
        (1..(HEIGHT-4)).each do |i|
            product = 1
            (0..3).each do |offset|
                product *= matrix[[i + offset, j]]      
            end 
            if product > max
                max = product
            end
        end
    end
    max
end

def get_max_vertical_product(matrix)
    max = 0
    (1..HEIGHT).each do |i|
        (1..(WIDTH-4)).each do |j|
            product = 1
            (0..3).each do |offset|
                product *= matrix[[i, j + offset]]
            end
            if product > max
                max = product
            end
        end
    end
    max
end

def get_max_left_diagonal_product(matrix)
    max = 0
    (1..HEIGHT).each do |i|
        (1..(WIDTH-4)).each do |j|
            product = 1
            (0..3).each do |offset|
                value = matrix[[i + offset, j + offset]]
                if( "Fixnum" == value.class.to_s )
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

def get_max_right_diagonal_product(matrix)
    max = 0
    (1..HEIGHT).each do |i|
        (1..(WIDTH-4)).each do |j|
            product = 1
            (0..3).each do |offset|
                value = matrix[[i + offset, j - offset]]
                if( "Fixnum" == value.class.to_s )
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

max_horizontal = get_max_horizontal_product(number_list)
max_vertical = get_max_vertical_product(number_list)
max_left_diagonal = get_max_left_diagonal_product(number_list)
max_right_diagonal = get_max_right_diagonal_product(number_list)

result = [max_horizontal, max_vertical, max_left_diagonal, 
            max_right_diagonal].max

puts result
