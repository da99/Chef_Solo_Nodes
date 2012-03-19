require 'Chef_Solo_Nodes/version'
require "json"

def Chef_Solo_Nodes raw_role = '*'
  
  if raw_role.is_a?(Array)
    role = '*'
    targets = raw_role
  else
    role = raw_role.to_s
    targets = Dir.glob("nodes/*.json")
  end
  
  targets.map { |str| 
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


