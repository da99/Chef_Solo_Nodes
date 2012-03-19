# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "Chef_Solo_Nodes/version"

Gem::Specification.new do |s|
  s.name        = "Chef_Solo_Nodes"
  s.version     = Chef_Solo_Nodes::VERSION
  s.authors     = ["da99"]
  s.email       = ["i-hate-spam-45671204@mailinator.com"]
  s.homepage    = "https://www.github.com/da99/chef_solo_nodes"
  s.summary     = %q{Grab node info from ./nodes/*.json}
  s.description = %q{
    Use with Chef-Solo.  Grabs node info as array of Hashes or String ips.
  }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bacon"
  s.add_development_dependency "rake"
  s.add_development_dependency 'Bacon_Colored'
  s.add_development_dependency 'pry'
  
  s.add_runtime_dependency "trollop"
end
