#     user     system      total        real
# 0.550000   0.010000   0.560000 (  0.548951)  Half interval search
# 0.370000   0.000000   0.370000 (  0.375907)  Reverse with second string
# 0.310000   0.000000   0.310000 (  0.317276)  Updated reverse with buffer string
# 0.030000   0.000000   0.030000 (  0.029246)  Ruby style xD

require 'benchmark'

def half_interval_search(string)
  0.upto (string.length / 2) do |i|
    swap = string[i]
    string[i] = string[string.length - (i + 1)]
    string[string.length - (i + 1)] = swap
  end
  return string
end

def reverse_with_second_string(string)
  result = ''
  (string.length - 1).downto 0 do |i|
    result += string[i]
  end
  return result
end

def reverse_with_buffer_string_updated(string)
  count = string.length - 1
  result = ''
  while count >= 0
    result += string[count]
    count -= 1
  end
  return result
end

def ruby_reverse(string)
  string.reverse
end

Benchmark.bm do |x|
  x.report do
    100_000.times do
      half_interval_search('Hello, world')
    end
  end
  x.report do
    100_000.times do
      reverse_with_second_string('Hello, world')
    end
  end
  x.report do
    100_000.times do
      reverse_with_buffer_string_updated('Hello, world')
    end
  end
  x.report do
    100_000.times do
      ruby_reverse('Hello, world')
    end
  end
end
