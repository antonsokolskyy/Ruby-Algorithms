# Bubble sort. O(n ^ 2)

#     user     system      total        real
# 0.140000   0.010000   0.150000 (  0.137163)

require 'benchmark'

@unsorted_array = Array.new(1_000) { rand(1..10_000) }

def bubble_sort(array)
  return array if array.size <= 1
  sorted = false
  until sorted
    sorted = true
    (array.size - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
    end
  end
  array
end

Benchmark.bm do |x|
  x.report do
    bubble_sort(@unsorted_array)
  end
end
