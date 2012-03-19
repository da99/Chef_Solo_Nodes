require 'Chef_Solo_Nodes/version'
require "json"

# 
#  Arguments:
#
#    role_or_paths = File paths Array OR Role name String.
#
#
def Chef_Solo_Nodes role_or_paths = '*'
  
  if role_or_paths.is_a?(Array)
    role = '*'
    files = role_or_paths
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

def Chef_Solo_IPs *args
  Chef_Solo_Nodes(*args).map { |h| 
    [ h['ipaddress'] || h['hostname'], h['port'] ].compact.join(':')
  }
end


