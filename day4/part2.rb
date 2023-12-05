require 'pp'

input = open("input.txt").read()


copies = [0]
input.lines.length.times do
    | x |
    copies[x+1] = 1
end
input.lines.each do
    | l |
    sides = l.split("|")
    card = sides[0].split(":")[0].match(/\d+/).to_s.to_i
    goals = sides[0].split(":")[1].scan(/\d+/).to_set
    haves = sides[1].scan(/\d+/).to_set
    shared = haves.intersection(goals)
    copies[card].times do
        shared.count.times do
            | x |
            copies[card+x+1] += 1
        end
    end
end

puts copies.sum

