input = open("input.txt").read()

# doing this just for the sake of silliness.
# because why write a loop or something when you can monkey-patch Enumerable to create exactly the oddly specific behaviour you want?
# my first solution used a loop but I want to learn to be cursed as fuck
module Enumerable
    # like each_cons but continues past where it can create complete chunks
    # [1,2,3].each_cons_to_end(2) { | x | print x } prints "[1,2] [2,3] [3]"
    def each_cons_to_end(n,&block)
        arr = ((0..self.count-1).map {|i|self.to_a[i..i+n-1] })
        if block then
            arr.each do
                | item |
                block.call item
            end
        else
        return arr.to_enum
        end
    end
end

# gets a number at the start of a string by weird AoC rules
def getNum(s)
    number_hash = {
    one:1,
    two:2,
    three:3,
    four:4,
    five:5,
    six:6,
    seven:7,
    eight:8,
    nine:9,
    zero:0
    }
    if (Integer(s[0]) rescue nil) then
        return Integer(s[0])
    end
    number_hash.keys.each do
        | x |
        if s.start_with? x.to_s then
            return number_hash[x]
        end
    end
    return nil
end

out = 0
print input.lines.map {
    | l |
    nums = l.each_char().each_cons_to_end(5).map { | s | getNum s.join "" }.filter { | s | s != nil }
    (nums.first.to_s + nums.last.to_s).to_i

}.sum
