
def valid_birth_year?(year)
    year.to_i >= 1920 && year.to_i <= 2002
end

def valid_issue_year?(year)
    year.to_i >= 2010 && year.to_i <= 2020
end


def valid_expiration_year?(year)
    year.to_i >= 2020 && year.to_i <= 2030
end


def valid_height?(height)
    case
    when height.nil?
        false
    when height.end_with?('cm')
        height.to_i >=150 && height.to_i <= 193
    when height.end_with?('in')
        height.to_i >=59 && height.to_i <= 76
    end
end

def valid_hair_colour?(colour)
    /^#[0-9a-f]{6}$/.match?(colour)
end

def valid_eye_colour?(colour)
    case colour
    when  'amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth' then true
    end
end

def valid_pid?(pid)
    /^[0-9]{9}$/.match?(pid)
end


File.open('./4-input') do |file|
    total = 0

    raw_passports = file.read.split("\n\n")

    raw_passports.each do |raw_passport|
        fields = raw_passport.split(/ |\n/)

        parsed_fields = {}

        fields.each do |field|
            key, value = field.split(':', 2)
            parsed_fields[key.to_sym] = value
        end

        next unless valid_birth_year?(parsed_fields[:byr])
        next unless valid_issue_year?(parsed_fields[:iyr])
        next unless valid_expiration_year?(parsed_fields[:eyr])
        next unless valid_height?(parsed_fields[:hgt])
        next unless valid_hair_colour?(parsed_fields[:hcl])
        next unless valid_eye_colour?(parsed_fields[:ecl])
        next unless valid_pid?(parsed_fields[:pid])

        total += 1
    end

    puts total
end
