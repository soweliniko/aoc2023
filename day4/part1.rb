input = open("input.txt").read()


counts = input.lines.map do
    | l |
    sides = l.split("|")
    goals = sides[0].split(":")[1].scan(/\d+/).to_set
    haves = sides[1].scan(/\d+/).to_set
    shared = haves.intersection(goals)

    score = 0
    shared.length.times do
        if score==0 then
            score = 1
        else
            score = score *2
        end
    end

    score
end

puts counts.sum
