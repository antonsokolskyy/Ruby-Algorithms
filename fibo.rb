# Find nth element in the Fibonacci sequence

#     user     system      total        real
# 1.050000   0.010000   1.060000 (  1.060593)  Recursive
# 0.000000   0.000000   0.000000 (  0.000025)  Memorize recursive
# 0.010000   0.000000   0.010000 (  0.000024)  Construstive
# 0.000000   0.000000   0.000000 (  0.000184)  Matrix (library)
# 0.000000   0.000000   0.000000 (  0.000010)  Matrix (no libraries)

require 'matrix'
require 'benchmark'

# runtime grows exponentially in n
# limited by the stack deep
def recursive_fibo(n)
  n < 3 ? 1 : recursive_fibo(n - 1) + recursive_fibo(n - 2)
end

# runtime O(n), storage O(n)
# limited by the stack deep
def memorized_recursive_fibo(n, memo = {})
  n < 3 ? 1 : memo[n] ||= memorized_recursive_fibo(n - 1, memo) + memorized_recursive_fibo(n - 2, memo)
end

# runtime O(n), storage O(1)
def constructive_fibo(n)
  current, prev = 1, 0
  n.times { current, prev = current + prev, current }
  prev
end

# runtime O(log n), storage on stack
# works fast for REALLY big factorials
# using Matrix library
def matrix_fibo(n)
  (Matrix[[1,1],[1,0]] ** n)[1,0]
end

# without libraries
def clean_matrix_fibo(n)
  return n if n == 0
  return [0,1] if n == 1
  f = clean_matrix_fibo(n / 2)
  c = f[0] * f[0] + f[1] * f[1]
  d = f[1] * (f[1] + 2 * f[0])
  n.even? ? [c, d] : [d, c + d]
end

Benchmark.bm do |x|
  x.report do
    recursive_fibo(35)
  end
  x.report do
    memorized_recursive_fibo(35)
  end
  x.report do
    constructive_fibo(35)
  end
  x.report do
    matrix_fibo(35)
  end
  x.report do
    clean_matrix_fibo(35)[1]
  end
end
