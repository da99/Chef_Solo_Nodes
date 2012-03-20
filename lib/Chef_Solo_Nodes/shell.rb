
begin
  
  require "Chef_Solo_Nodes"
  require "trollop"

  opts = Trollop::options do
    opt :no_user, "Avoid printing any user/login value", :default=>false
  end

  opts[ :format ] = File.basename($0)
  
  glob = "nodes/#{ARGV.first}.json"
  n = Chef_Solo_IPs(Dir.glob glob).first

  raise RuntimeError, "Not found: #{glob}" unless n

  uri = URI.parse("ssh://#{n}")

  case opts.format
  when "IP"
    print "#{uri.user}@" if uri.user && !opts[:no_user]
    print "#{uri.host}"
    print ":#{uri.port}" if uri.port
  when "SSH"
    print "-p #{uri.port} " if uri.port
    print "#{uri.user}@" if uri.user && !opts[:no_user]
    print "#{uri.host}"
  else
    raise ArgumentError, "Unknown format: #{opts.format.inspect}"
  end
  
rescue Object => e
  print 'xx.xx.xx.xx'
  raise e
  
end
