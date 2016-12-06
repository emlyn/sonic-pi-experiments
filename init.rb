# Sonic Pi init file
# Code in here will be evaluated on launch.
# Linked to from ~/.sonic-pi/init.rb

mypath = "/Users/emlyn/dev/personal/sonic-pi-experiments"

#Load any snippets in the snippets subdirectory
load_snippets mypath + "/snippets", true

# Run all files in the helpers subdirectory
Dir.glob(mypath + "/helpers/**/*.{spi,rb}").each do |path|
  run_file path
end

# Load a file from my sonic-pi-experiments repo, match can be string/regex
define :load do |match='/', index=nil, path=mypath|
  path = path.end_with?('/') ? path : path + '/'
  if match.is_a?(Symbol)
    match = Regexp.new(Regexp.escape(match.to_s), Regexp::IGNORECASE)
  end
  files = Dir.glob(path + "**/*.{spi,rb}").map {|p| p.slice(path.length..-1)}
  candidates = files.select {|p| p.index(match)}
  case candidates.length
  when 0
    puts "Unable to find #{match.inspect} in #{files}"
  when 1
    load_buffer path + candidates[0]
  else
    if index then
      load_buffer path + candidates.ring[index]
    else
      puts "Found multiple matches for #{match.inspect}:"
      candidates.each_with_index do |c, i|
        puts "#{i} - #{c}"
      end
    end
  end
end
