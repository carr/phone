# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "phonie/version"

Gem::Specification.new do |s|
  s.name        = "phonie"
  s.version     = Phonie::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors  = ['Tomislav Car', 'Todd Eichel', 'Don Morrison', 'Wesley Moxam']
  s.email    = ['tomislav@infinum.hr', 'todd@toddeichel.com', 'elskwid@gmail.com', 'wesley@wmoxam.com']
  s.homepage    = "http://github.com/wmoxam/phonie"
  s.summary     = %q{Phone number parsing, validation and formatting}
  s.description = %q{Phone number parsing, validation and formatting}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
  s.add_development_dependency 'rake'
  s.add_development_dependency 'nokogiri'
end
