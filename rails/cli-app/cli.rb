#!/usr/bin/env ruby
require 'readline'

OPERATORS = ['+', '-', '*', '/']

def calculate(num1, operator, num2)
  case operator
  when '+' then num1 + num2
  when '-' then num1 - num2
  when '*' then num1 * num2
  when '/' then num1 / num2
  else
    raise "Unsupported operator: #{operator}"
  end
end

# Configure tab completion
Readline.completion_proc = proc do |input|
  OPERATORS.grep(/^#{Regexp.escape(input)}/)
end

if ARGV.size != 3
  puts "Usage: ruby cli.rb [number1] [operator] [number2]"
  puts "Example: ruby cli.rb 5 + 3"
  exit(1)
end

begin
  num1 = ARGV[0].to_f
  operator = ARGV[1]
  
  # Enable readline for operator input if not provided
  if operator.empty?
    operator = Readline.readline('Enter operator (+ - * /): ', true)
  end
  
  num2 = ARGV[2].to_f
  
  result = calculate(num1, operator, num2)
  puts "Result: #{result}"
rescue => e
  puts "Error: #{e.message}"
  exit(1)
end
