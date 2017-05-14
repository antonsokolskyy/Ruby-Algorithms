# String reverse using C code and inline gem

#     user     system      total        real
# 0.040000   0.000000   0.040000 (  0.037847)

require 'benchmark'
require 'inline'

class InlineTest
  inline do |builder|
    builder.c '
      char * string_reverse(char* str) {
        int i, j;
        char temp;
        i=j=temp=0;

        j=strlen(str)-1;
        for (i=0; i<j; i++, j--)
        {
            temp=str[i];
            str[i]=str[j];
            str[j]=temp;
        }
        return str;
      }'
  end
end

Benchmark.bm do |x|
  x.report do
    100_000.times do
      InlineTest.new.string_reverse('Hello, world')
    end
  end
end
