

def get_total(row_increment, column_increment)
    column = 0
    row = 0
    total = 0
    lines = File.readlines('./3-input', chomp: true)

    repeat_after = lines.first.length

    while row < lines.length do
        row = row + row_increment
        column = (column + column_increment) % repeat_after

        break if lines[row].nil?

        total += 1 if lines[row][column] == '#'
    end

    total
end

puts get_total(1, 1) * get_total(1, 3) * get_total(1, 5) * get_total(1, 7) * get_total(2, 1)