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

# IRB.conf[:PROMPT][:MY_PROMPT] = { # name of prompt mode
#   :PROMPT_I => '--> ', # normal prompt
#   :PROMPT_S => '--" ', # prompt for continuing strings
#   :PROMPT_C => '--+ ', # prompt for continuing statement
#   :RETURN => "  ==> %s\n" # format to return value
# }
#
# IRB.conf[:PROMPT_MODE] = :MY_PROMPT
