#SOLVED

filename = 'numbers.txt'

file = File.new(filename)
lines = [];
file.each_line do |line|
    lines.push(line.split(' ').to_a)
end

puts "Length =  #{lines.length}"
WIDTH = lines.length
HEIGHT = lines[0].length 

number_list = Hash.new
(1..HEIGHT).each do |i|
    (1..WIDTH).each do |j|
        number_list[[i,j]] = (lines[i-1])[j-1].to_i
    end
end

# At this point, the matrix has been populated and stored (in a hash)

def get_max_horizontal_product(matrix)
    max = 0
    factor_list = []
    (1..WIDTH).each do |j|
        (1..(HEIGHT-4)).each do |i|
            product = 1
            (0..3).each do |offset|
                product *= matrix[[i + offset, j]]      
            end 
            if product > max
                max = product
                factor_list = [ "j = #{j}", matrix[[i,j]], matrix[[i+1,j]], 
                                matrix[[i+2,j]], matrix[[i+3,j]] ]
            end
        end
    end
    [max, factor_list]
end

def get_max_vertical_product(matrix)
    max = 0
    factor_list = []
    (1..HEIGHT).each do |i|
        (1..(WIDTH-4)).each do |j|
            product = 1
            (0..3).each do |offset|
                product *= matrix[[i, j + offset]]
            end
            if product > max
                max = product
                factor_list = [ "i = #{i}", matrix[[i, j]], matrix[[i, j+1]],
                                matrix[[i, j+2]], matrix[[i, j+3]] ]
            end
        end
    end
    [max, factor_list]
end

def get_max_left_diagonal_product(matrix)
    max = 0
    factor_list = []
    (1..HEIGHT).each do |i|
        (1..(WIDTH-4)).each do |j|
            product = 1
            (0..3).each do |offset|
                if( "Fixnum" == matrix[[i + offset,j + offset]].class.to_s )
                    product *= matrix[[i + offset, j + offset ]] 
                end
            end
            if product > max
                max = product
                factor_list = [ "i = #{i}", "j = #{j}" ]
            end
        end
    end
    [max, factor_list]
end

def get_max_right_diagonal_product(matrix)
    max = 0
    factor_list = []
    (1..HEIGHT).each do |i|
        (1..(WIDTH-4)).each do |j|
            product = 1
            (0..3).each do |offset|
                if( "Fixnum" == matrix[[i + offset, j - offset]].class.to_s )
                    product *= matrix[[i + offset, j - offset]]
                end
            end
            if product > max
                max = product
                factor_list = [ "i = #{i}", "j = #{j}" ]
            end
        end
    end
    [max, factor_list]
end

max_horizontal = get_max_horizontal_product(number_list)
max_vertical = get_max_vertical_product(number_list)
max_left_diagonal = get_max_left_diagonal_product(number_list)
max_right_diagonal = get_max_right_diagonal_product(number_list)

result = [max_horizontal, max_vertical, max_left_diagonal, 
            max_right_diagonal].max

puts result
