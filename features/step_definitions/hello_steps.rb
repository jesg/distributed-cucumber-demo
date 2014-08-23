Given(/^Hello World "(\d+)"$/) do |i|
  puts "Greeting #{i}"
  sleep 1  # slow test down
end
