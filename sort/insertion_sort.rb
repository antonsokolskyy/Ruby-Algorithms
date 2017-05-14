# Insertion sort. O(n ^ 2)

#     user     system      total        real
# 0.080000   0.000000   0.080000 (  0.082080)  Insertion sort
# 0.080000   0.000000   0.080000 (  0.072804)  Updated insertion sort
# 0.010000   0.000000   0.010000 (  0.017078)  Insertion sort with second string

require 'benchmark'

@unsorted_array = Array.new(1_000) { rand(1..10_000) }

def insertion_sort(array)
  1.upto(array.size - 1) do |i|
    i.downto(1).each do |j|
      break unless array[j - 1] > array[j] 
      array[j - 1], array[j] = array[j], array[j - 1]
    end
  end
  array
end

def insertion_sort_updated(array)
  for i in 1..(array.size - 1)
    j = i
    while j > 0
      array[j - 1], array[j] = array[j], array[j - 1] if array[j - 1] > array[j]
      j -= 1
    end
  end
  array
end

def insertion_sort_with_second_array(array)
  final_array = [array.shift]
  for i in array
    final_index = 0
    while final_index < final_array.size
      if i <= final_array[final_index]  
        final_array.insert(final_index, i)
        break
      elsif final_index == final_array.size - 1
        final_array.insert(final_index + 1, i)
        break
      end
      final_index += 1
    end
  end
  final_array
end

Benchmark.bm do |x|
  x.report do
    insertion_sort(@unsorted_array.dup)
  end
  x.report do
    insertion_sort_updated(@unsorted_array.dup)
  end
  x.report do
    insertion_sort_with_second_array(@unsorted_array.dup)
  end
end
