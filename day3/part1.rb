require "pp"

input = open("input.txt").read()
$width = input.split("\n")[0].length

# I'm doing this kept as a string Reasons (idk it's AoC don't judge  )
GRID = input.gsub("\n","")

# check for adjacent symbols
def has_adj_symbol(indx)
    # directions to check
    directions = [
        -1, 1, # directly before/after
        -$width, $width,  # row before/after
        -$width-1, -$width+1, $width-1, $width+1 # diagonals
    ]
    adj_symbol = false
    directions.each do
        | x |
        begin
        if GRID[indx-x].match(/[^.\d]/) then
            adj_symbol = true
        end
        rescue
        end
    end

    return adj_symbol
end


total = 0
GRID.chars.each_with_index do
    | c, indx |
    if c.match(/\d/) and GRID[indx-1].match(/[^\d]/) then
        number =  /\d+/.match(GRID,indx).to_s
        is_part = false
        number.length.times do
            | n |
            if has_adj_symbol(indx+n) then
                is_part = true
            end
        end
        if is_part then
            total += number.to_i
        end
    end
end

puts total
