# Selection sort. O(n ^ 2)

#     user     system      total        real
# 0.040000   0.000000   0.040000 (  0.038211)  Selection sort
# 0.100000   0.010000   0.110000 (  0.097519)  Selection sort(Ruby style)

require 'benchmark'

@unsorted_array = Array.new(1_000) { rand(1..10_000) }

def selection_sort(array)
  n = array.size - 1
  n.times do |i|
    index_min = i
    (i + 1).upto(n) do |j|
      index_min = j if array[j] < array[index_min]
    end
    array[i], array[index_min] = array[index_min], array[i] if index_min != i
  end
  array
end

def selection_sort_ruby_style(array)
  n = array.size - 1
  n.times do |i|
    (i + 1).upto(n) { |j| array[i], array[j] = array[j], array[i] if array[i] > array[j] }
  end
  array
end

Benchmark.bm do |x|
  x.report do
    selection_sort(@unsorted_array.dup)
  end
  x.report do
    selection_sort_ruby_style(@unsorted_array.dup)
  end
end
