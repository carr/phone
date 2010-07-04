Gem::Specification.new do |s|
  s.name    = 'phone'
  s.version = '0.9.9.1'
  s.date    = '2010-03-08'
  
  s.summary = "Phone number parsing, validation and formatting"
  s.description = "Phone number parsing, validation and formatting."
  
  s.authors  = ['Tomislav Car', 'Todd Eichel']
  s.email    = ['tomislav@infinum.hr', 'todd@toddeichel.com']
  s.homepage = 'http://github.com/carr/phone'
  
  s.has_rdoc = true
  s.rdoc_options = ['--main', 'Readme.rdoc']
  s.rdoc_options << '--inline-source' << '--charset=UTF-8'
  s.extra_rdoc_files = ['Readme.rdoc', 'LICENSE']
  
  s.require_paths = ["lib"]
  
  s.files = %w(Readme.rdoc LICENSE data/phone_countries.yml lib/phone.rb lib/phone_country.rb test/phone_test.rb test/phone_country_test.rb test/test_helper.rb)
  s.test_files = %w(test/phone_test.rb test/phone_country_test.rb test/test_helper.rb)
end
