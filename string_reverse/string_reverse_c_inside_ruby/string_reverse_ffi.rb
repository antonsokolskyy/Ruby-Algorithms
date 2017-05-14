# String reverse using C code and ffi gem (C code is previously compiled)

#     user     system      total        real
# 0.030000   0.000000   0.030000 (  0.037470)

require 'benchmark'
require 'ffi'

module StringReverser
  extend FFI::Library
  ffi_lib 'c'
  ffi_lib './string_reverse.so'
  attach_function :string_reverse, [ :string ], :string
end

Benchmark.bm do |x|
  x.report do
    100_000.times do
      StringReverser.string_reverse('Hello, world')
    end
  end
end
