require "pp"

input = open("test2").read()
$width = input.split("\n")[0].length

# I'm doing this kept as a string Reasons (idk it's AoC don't judge  )
GRID = input.gsub("\n","")

# returns the index of a * if there is one adjacent to the number
def get_star(indx)
    # directions to check
    directions = [
        -1, 1, # directly before/after
        -$width, $width,  # row before/after
        -$width-1, -$width+1, $width-1, $width+1 # diagonals
    ]
    directions.each do
        | x |
        if indx - x > 0 and GRID[indx-x] == "*" then
            return indx-x
        end
    end

    return nil
end
possible_gears = {}
GRID.chars.each_with_index do
    | c, indx |
    if c.match(/\d/) and GRID[indx-1].match(/[^\d]/) then
        number =  /\d+/.match(GRID,indx).to_s
        is_part = false
        number.length.times do
            | n |
            if pos = get_star(indx+n) then
                if possible_gears[pos] == nil then
                    possible_gears[pos] = [number.to_i]
                else
                    if not possible_gears[pos].include? number.to_i then
                        possible_gears[pos].append number.to_i
                    end
                end
            end
        end
    end
end

total = 0
possible_gears.each do
    | k, v |
    if v.length == 2 then
        total = total + (v[0] * v[1])
        print v, "\n"
    end
end

puts total
