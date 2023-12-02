input = open("input.txt").read()

# returns game number if it's possible, 0 otherwise
def test_game(l)
    game = /Game (\d+)/.match(l)[1]
    moves = l.split(":")[1].scan(/(\d+) (red|green|blue)/).map { | x | [Integer(x[0]), x[1].to_sym]}

    totals = moves.each_with_object({red:0,green:0,blue:0}) do
        | m, totals |
        if m[0] > totals[m[1]] then
            totals[m[1]] = m[0]
        end
    end
    return totals[:red] * totals[:green] * totals[:blue]
end

puts input.lines.map {|x| test_game(x)}.sum
