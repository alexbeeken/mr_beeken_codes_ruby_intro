SUPPOSED_TO_FAIL = [
  './examples/episode4/strings2.rb',
  './examples/episode4/strings5.rb',
  './examples/episode4/strings9.rb',
  './examples/episode4/strings11.rb',
  './examples/episode5/methods6.rb',
  './examples/episode12/class3.rb',
  './examples/episode13/methods3.rb',
  './examples/episode15/ops2-5.rb', # issue with eval
  './examples/episode17/scope3.rb'
]

ERROR_LOG_FILE = './error.log'
ERROR_LOG = File.open(ERROR_LOG_FILE, 'w')
$current_env = nil

def eval_with_reload(code)
  $current_env = Object.new
  $current_env.instance_eval(code)
  $current_env = nil
end

def recurse_directories(dir)
  puts 'looking at: ' + dir if ENV['VERBOSE']
  Dir.each_child(dir) do |child_filename|
    child = dir + '/' + child_filename
    next if child == '.' or child == '..'
    puts 'looking at child: ' + child if ENV['VERBOSE']

    if !child.include? '.rb'
      puts 'recursing: ' + child if ENV['VERBOSE']
      recurse_directories(child)
      next
    end

    puts 'reading: ' + child if ENV['VERBOSE']
    content = File.open(child, 'r').read

    begin
      if SUPPOSED_TO_FAIL.include? child
        puts child + 'skipped because it\'s supposed to error'
      else
        puts 'running code...' if ENV['VERBOSE']
        eval_with_reload(content)
        puts 'succes!' if ENV['VERBOSE']
      end
    rescue => e
      error_message = "ERROR in file: #{child} : #{e.message}"
      puts error_message
      ERROR_LOG.write error_message
    end
  end
end

recurse_directories('./examples')
