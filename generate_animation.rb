file = ARGV[0].dup
template_file = ARGV[1] || '/Users/alex/Code/mr_beeken_codes_ruby_intro/generateAnimationTemplate.jsx'

if ARGV.any? { |arg| arg.include? '--delay=' }
  delay = arg.split('--delay').last
else
  delay = "2"
end

output_file = file.gsub('.rb', '.jsx')

puts 'reading file...'

input = File.open(file, 'r').read

puts 'script content: ' + input

if input[-1] == "\n"
  input[-1] = ''
end

puts 'evaluating script code...'

# very insecure make sure you know what this code does
code_result = %x[ruby #{file}]

print "finished.\n"
puts 'captured output: ' + code_result

puts 'building animation from template file: ' + template_file

output_template = File.open(template_file, 'r').read

puts 'subbing INPUTFILE...'
display_file = file.split('/').last
output_template.gsub! 'INPUTFILE', "ruby #{display_file}"
puts 'subbing OUTPUT...'
output_template.gsub! 'RESULT', code_result
puts 'subbing DELAY...'
output_template.gsub! 'DELAY', delay
puts 'subbing SCRIPTCONTENT...'
output_template.gsub! 'SCRIPTCONTENT', "'#{input}'"

puts 'writing to file: ' + output_file
output = File.open(output_file, 'w') 
output.write(output_template)
puts 'closing file'
output.close
puts 'finished successfully! final result: ' + output_template
