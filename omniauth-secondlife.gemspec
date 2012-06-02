# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-secondlife/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-secondlife"
  s.version     = OmniAuth::SecondLife::VERSION
  s.authors     = ["Tristan Rice"]
  s.email       = ["rice@outerearth.net"]
  s.homepage    = "https://github.com/d4l3k/omniauth-secondlife"
  s.summary     = "Second Life strategy for OmniAuth"

  s.rubyforge_project = "omniauth-secondlife"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "omniauth-openid"
  s.add_runtime_dependency "multi_json"
end
