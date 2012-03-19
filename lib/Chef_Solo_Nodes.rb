require 'Chef_Solo_Nodes/version'
require "json"

def Chef_Solo_Nodes raw_role = '*'
  role = raw_role.to_s
  all  = Dir.glob("nodes/*.json").map { |str| 
    h = JSON(File.read(str))
    h['ipaddress'] ||= File.basename(str).sub(".json", "")
    h
  }
  return all if role == '*'
  
  all.select { |h| 
    (h['roles'] || []).include?(role) 
  }
end

def Chef_Solo_IPs *args
  Chef_Solo_Nodes(*args).map { |h| 
    [ h['ipaddress'] || h['hostname'], h['port'] ].compact.join(':')
  }
end


