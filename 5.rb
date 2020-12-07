lines = File.readlines('./5-input', chomp: true)
seats = lines.map(&:chars)

higest_seat = 0

def calculate_seat_number(seat_spec)
    max_row = 127.0
    min_row = 0.0
    actual_row = nil

    puts "spec: #{seat_spec}"

    # the first 7 characters are F or B
    seat_spec.take(6).each do |char|
        if char == 'F'
            max_row = ((min_row + max_row) / 2).floor
        else
            min_row = ((min_row + max_row) / 2).ceil
        end

        puts "min: #{min_row} max: #{max_row}"
    end

    actual_row = ((max_row + min_row) / 2).ceil

    puts "they are on row #{actual_row}"

    # the last 3 characters are L or R
    seat_spec.last(3).each do |char|

    end
end

seats.each do |seat_spec|
    calculate_seat_number(seat_spec)
end