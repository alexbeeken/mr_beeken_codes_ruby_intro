file = ARGV[0].dup

template_file = '/Users/alex/Code/mr_beeken_codes_ruby_intro/generateAnimationTemplate.jsx'
delay = '2'
default_outfilepath = file.gsub('.rb', '.jsx')
display_file = file.split('/').last
file_basename = default_outfilepath.split('/').last
outdir = nil

ARGV.each_with_index do |arg, index|
  if arg.include? '--delay='
    delay = arg.split('--delay=').last
    delay = arg.split(' ').first
  elsif arg.include? '--out_dir='
    outdir_path = arg.split('--out_dir=').last
    outdir = outdir_path.split(' ').first
  elsif index == 1
    template_file = arg
  end
end

if outdir
  outfile = "./#{outdir}/#{file_basename}"
else
  outfile = default_outfilename
end

puts 'using template file: ' + template_file
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
output_template.gsub! 'INPUTFILE', "ruby #{display_file}"
puts 'subbing OUTPUT...'
output_template.gsub! 'RESULT', code_result
puts 'subbing DELAY...'
output_template.gsub! 'DELAY', delay
puts 'subbing SCRIPTCONTENT...'
output_template.gsub! 'SCRIPTCONTENT', "'#{input}'"

puts 'writing to file: ' + outfile
output = File.open(outfile, 'w') 
output.write(output_template)
puts 'closing file'
output.close
puts 'finished successfully! final result: ' + output_template
