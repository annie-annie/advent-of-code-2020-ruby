file = File.read('./6-input')


groups = file.split("\n\n")

sums = groups.map do |group|
    clean_group = group.split("\n").map(&:chars)
    unique = clean_group.uniq
    unique.count
end

puts sums.sum