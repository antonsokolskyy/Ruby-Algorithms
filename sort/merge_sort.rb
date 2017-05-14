# Merge sort. O(n log n)

#     user     system      total        real
# 0.000000   0.000000   0.000000 (  0.002337)  Merge sort

require 'benchmark'

@unsorted_array = Array.new(1_000) { rand(1..10_000) }

def merge_sort(array)
  return array if array.size <= 1
  mid = array.size / 2
  merge(merge_sort(array[0...mid]), merge_sort(array[mid...array.size]))
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << (left[0] <= right[0] ? left : right).shift
  end
  result.concat(left).concat(right)
end

Benchmark.bm do |x|
  x.report do
    merge_sort(@unsorted_array.dup)
  end
end
