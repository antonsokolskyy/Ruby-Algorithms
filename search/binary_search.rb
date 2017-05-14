# Binary search. O(log n)

#       user     system      total        real
# Found! Index is 911575
#  0.000000   0.000000   0.000000 (  0.000035)  Iterative (With index)
# Found
#  0.000000   0.000000   0.000000 (  0.000033)  Recursive (Without index)

require 'benchmark'

@sorted_array = Array.new(1_000_000) { rand(1..10_000_000) }.uniq.sort
random_index = rand(0..@sorted_array.size - 1)
@random_value = @sorted_array[random_index]

def iterative_binary_search(array, value)
  from = 0
  to = array.count - 1
  while from < to
    mid = (from + to) / 2
    return "Found! Index is #{mid}" if array[mid] == value
    array[mid] < value ? from = mid + 1 : to = mid
  end
  'Not Found'
end

def recursive_binary_search(array, value)
  from = 0
  to = array.count - 1
  return 'Not Found' if from > to
  mid = (from + to) / 2
  return 'Found' if array[mid] == value
  if array[mid] < value
    recursive_binary_search(array[(mid + 1)..to], value)
  else
    recursive_binary_search(array[from..mid], value)
  end
end

Benchmark.bm do |x|
  x.report do
    puts iterative_binary_search(@sorted_array, @random_value)
  end
  x.report do
    puts recursive_binary_search(@sorted_array, @random_value)
  end
end
