require 'Chef_Solo_Nodes/version'
require "uri"
require "json"

# 
#  Arguments:
#
#    role_or_paths = File paths Array OR Role name String.
#
#  Returns:
#
#    Array of Hashes.
#
def Chef_Solo_Nodes role_or_paths = '*'
  
  if role_or_paths.is_a?(Array)
    role = '*'
    files = role_or_paths.map { |path| File.expand_path(path) }
  else
    role = role_or_paths.to_s
    files = Dir.glob("nodes/*.json")
  end
  
  files.map { |str| 
    h = JSON(File.read(str))
    next if role != '*' && !(h['roles'] || []).include?(role)
    h['ipaddress'] ||= File.basename(str).sub(".json", "")
    h
  }.compact
  
end

# 
#  Arguments:
#
#    Same as Chef_Solo_Nodes()
#
#  Returns:
#
#    Array of Strings.
#
def Chef_Solo_IPs *args
  Chef_Solo_Nodes(*args).map { |h| 
    u = h['user'] || h['login']
    a = h['ipaddress'] || h['hostname'] 
    p = h['port'] 

    final = [u, a].compact.join('@')
    final = [final, p].compact.join(':')
    final
  }
end

