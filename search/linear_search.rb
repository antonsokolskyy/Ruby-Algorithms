# Linear search. O(n)

#       user     system      total        real
# Found! Index is 750805
#  0.070000   0.000000   0.070000 (  0.072742)  Search with index
# Found
#  0.050000   0.000000   0.050000 (  0.055589)  Search without index
# Found! Index is 750805
#  0.010000   0.000000   0.010000 (  0.008600)  Updated search with index

require 'benchmark'

@sorted_array = Array.new(1_000_000) { rand(1..10_000_000) }.uniq.sort
random_index = rand(0..@sorted_array.size - 1)
@random_value = @sorted_array[random_index]

def linear_search_with_index(array, value)
  array.each_with_index do |item, i|
    return "Found! Index is #{i}" if item == value
  end
  'Not Found'
end

def linear_search(array, value)
  array.each do |item|
    return 'Found' if item == value
  end
  'Not Found'
end

def linear_search_updated(array, value)
  count = array.size - 1
  while count >= 0
    count -= 1
    return "Found! Index is #{count}" if array[count] == value
  end
  'Not Found'
end

Benchmark.bm do |x|
  x.report do
    puts linear_search_with_index(@sorted_array, @random_value)
  end
  x.report do
    puts linear_search(@sorted_array, @random_value)
  end
  x.report do
    puts linear_search_updated(@sorted_array, @random_value)
  end
end
