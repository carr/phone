# -*- encoding: utf-8 -*-

require File.expand_path("../lib/phone/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "phone"
  gem.version       = Phone::VERSION
  gem.summary       = %q{Phone number parsing, validation and formatting}
  gem.description   = %q{Phone number parsing, validation and formatting in Ruby}
  gem.license       = "MIT"
  gem.authors       = ["Tomislav Carr", "Todd Eichel", "Don Morrison"]
  gem.email         = ["tomislav@infinum.hr", "todd@toddeichel.com", "don@elskwid.net"]
  gem.homepage      = "https://github.com/carr/phone#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.2"
  gem.add_development_dependency "minitest", "~> 5.0"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_development_dependency "rubygems-tasks", "~> 0.2"
  gem.add_development_dependency "yard", "~> 0.8"
  gem.add_development_dependency "carmen"
end
