customers = [
  "Ruth",
  "Maya",
  "Camala",
  "LaDonna"
]

count.each_with_index do |customer, index|
  puts "#{index + 1}. #{customer}"
end
