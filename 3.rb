lines = File.readlines('./3-input', chomp: true)

column = 0
total = 0
repeat_after = lines.first.length



lines.drop(1).each do |line|
    column = (column + 3) % repeat_after
    total += 1 if line[column] == '#'

end

puts total