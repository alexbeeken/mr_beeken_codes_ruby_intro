ERROR_LOG_FILE = './error.log'
ERROR_LOG = File.open(ERROR_LOG_FILE, 'w')

def recurse_directories(dir)
  puts 'recursing dir : ' + dir if ENV['VERBOSE']
  Dir.each_child(dir) do |child_filename|
    child = dir + '/' + child_filename
    next if child == '.' or child == '..'
    puts 'looking at child: ' + child if ENV['VERBOSE']

    if !child.include? '.rb'
      recurse_directories(child)
      next
    end

    puts 'reading: ' + child if ENV['VERBOSE']
    content = File.open(child, 'r').read

    begin
      puts 'generating animation' if ENV['VERBOSE']
      system "ruby generate_animation.rb #{child} --out_dir=/animations"
      puts 'succes!' if ENV['VERBOSE']
    rescue => e
      error_message = "ERROR in file: #{child} : #{e.message}"
      puts error_message
      ERROR_LOG.write error_message
    end
  end
end

recurse_directories('./examples')
