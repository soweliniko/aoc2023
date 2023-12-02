input = open("input.txt").read()

TARGET_CUBES = {
    red: 12,
    green: 13,
    blue: 14}

# returns game number if it's possible, 0 otherwise
def test_game(l)
    game = /Game (\d+)/.match(l)[1]
    moves = l.split(":")[1].scan(/(\d+) (red|green|blue)/).map { | x | [Integer(x[0]), x[1].to_sym]}

    moves.each do
        | m |
        if m[0] > TARGET_CUBES[m[1]] then
            return 0
        end
    end
    return game.to_i
end

puts input.lines.map {|x| test_game(x)}.sum
