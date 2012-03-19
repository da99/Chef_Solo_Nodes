
require File.expand_path('spec/helper')
require 'Chef_Solo_Nodes'
require 'Bacon_Colored'
require 'pry'


def chdir 
  Dir.chdir("spec/data/") { yield }
end


# ======== Include the tests.
if ARGV.size > 1 && ARGV[1, ARGV.size - 1].detect { |a| File.exists?(a) }
  # Do nothing. Bacon grabs the file.
else
  Dir.glob('spec/tests/*.rb').each { |file|
    require File.expand_path(file.sub('.rb', '')) if File.file?(file)
  }
end
