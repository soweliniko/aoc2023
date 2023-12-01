input = open("input.txt").read()

output = 0

input.split("\n").each do
    | line |
    nums = line.chars.select {|c | Integer(c) rescue false}
    result = nums.first + nums.last
    output += result.to_i
end

puts output

