lines = File.readlines('./5-input', chomp: true)
seats = lines.map(&:chars)

higest_seat = 0

def calculate_seat_number(seat_spec)
    max_row = 127.0
    min_row = 0.0
    actual_row = nil

    # the first 7 characters are F or B
    seat_spec.take(7).each do |char|
        if char == 'F'
            max_row = ((min_row + max_row) / 2).floor
        else
            min_row = ((min_row + max_row) / 2).floor + 1
        end
    end

    actual_row = max_row

    max_column = 7
    min_column = 0
    actual_column = nil

    # the last 3 characters are L or R
    seat_spec.last(3).each do |char|
        if char == 'L'
            max_column = ((min_column + max_column) / 2).floor
        else
            min_column = ((min_column + max_column) / 2).floor + 1
        end
    end

    actual_column = max_column

    seat_id = actual_row * 8 + actual_column
end

puts seats.map { |seat_spec| calculate_seat_number(seat_spec) }.max