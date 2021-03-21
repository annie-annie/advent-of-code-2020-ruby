file = File.read('./6-input')


groups = file.split("\n\n")

sums = groups.map do |group|
    clean_group = group.split("\n").map(&:chars)
    clean_group[1..].reduce(clean_group.first) { |unique, answers| unique & answers}.count
end

puts sums.sum