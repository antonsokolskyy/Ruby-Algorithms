# Quick sort. O(n log n). Worst case O(n ^ 2)

#     user     system      total        real
# 0.010000   0.000000   0.010000 (  0.003745)  Quick sort
# 0.000000   0.000000   0.000000 (  0.003502)  Quick sort (Ruby style)

require 'benchmark'

@unsorted_array = Array.new(1_000) { rand(1..10_000) }

def quick_sort(array)
  if array.size <= 1
    return array
  else
    pivot = array.sample
    array.delete_at(array.index(pivot))
    less = []
    greater = []
    array.each do |el|
      if el <= pivot
        less << el
      else
        greater << el
      end
    end
    sorted_array = []
    sorted_array << quick_sort(less)
    sorted_array << pivot
    sorted_array << quick_sort(greater)
    sorted_array.flatten
  end
end

def quick_sort_ruby_style(array)
  return [] if array.empty?
  pivot = array.delete_at(rand(array.size))
  left, right = array.partition(&pivot.method(:>))
  return *quick_sort(left), pivot, *quick_sort(right)
end

Benchmark.bm do |x|
  x.report do
    quick_sort(@unsorted_array.dup)
  end
  x.report do
    quick_sort_ruby_style(@unsorted_array.dup)
  end
end
