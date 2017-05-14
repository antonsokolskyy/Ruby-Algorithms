#     user     system      total        real
# 0.760000   0.030000   0.790000 (  0.791569)  Iterative
# 0.760000   0.030000   0.790000 (  0.794506)  Recursive
# 0.750000   0.030000   0.780000 (  0.783031)  Ruby style

require 'benchmark'

def iterative_factorial(n)
  sum = 1
  until n == 0
    sum *= n
    n -= 1
  end
  return sum
end

def recursive_factorial(n)
  n == 0 ? 1 : n * recursive_factorial(n - 1)
end

def ruby_style_factorial(n)
  (1..n).inject(1, :*)
end

Benchmark.bm do |x|
  x.report do
    1_000.times do
      iterative_factorial(1_000)
    end
  end
  x.report do
    1_000.times do
      recursive_factorial(1_000)
    end
  end
  x.report do
    1_000.times do
      ruby_style_factorial(1_000)
    end
  end
end
