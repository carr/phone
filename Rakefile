# encoding: utf-8

require "rubygems"

begin
  require "bundler"
rescue LoadError => e
  warn e.message
  warn "Run `gem install bundler` to install Bundler."
  exit -1
end

begin
  Bundler.setup(:development)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems."
  exit e.status_code
end

require "rake"

require "rubygems/tasks"
Gem::Tasks.new

require "rake/testtask"

Rake::TestTask.new do |test|
  test.libs << "test"
  test.pattern = "test/**/*_test.rb"
  test.verbose = true
end

require "yard"
YARD::Rake::YardocTask.new
task :doc => :yard
