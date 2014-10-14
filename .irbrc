require 'irb/completion'

IRB.conf[:AUTO_INDENT] = true

def time(&block)
  require 'benchmark'
  result = nil
  timing = Benchmark.measure do
    result = block.()
  end
  puts "It took: #{timing}"
  result
end
