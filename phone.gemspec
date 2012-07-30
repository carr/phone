Gem::Specification.new do |s|
  s.name    = 'phone'
  s.version = '1.1'
  s.date    = '2012-02-27'

  s.summary = "Phone number parsing, validation and formatting"
  s.description = "Phone number parsing, validation and formatting."

  s.authors  = ['Tomislav Car', 'Todd Eichel', 'Don Morrison', 'Wesley Moxam']
  s.email    = ['tomislav@infinum.hr', 'todd@toddeichel.com', 'elskwid@gmail.com', 'wesley.moxam@gmail.com']
  s.homepage = 'http://github.com/carr/phone'

  s.has_rdoc = true
  s.rdoc_options = ['--main', 'Readme.rdoc']
  s.rdoc_options << '--inline-source' << '--charset=UTF-8'
  s.extra_rdoc_files = ['Readme.rdoc', 'LICENSE']

  s.require_paths = ["lib"]

  s.files = %w(
      Readme.rdoc 
      LICENSE 
      data/phone_countries.yml
      lib/phone.rb
      lib/country.rb
      lib/support.rb
      test/extension_test.rb
      test/phone_test.rb
      test/test_helper.rb
      test/countries/au_test.rb
      test/countries/ba_test.rb
      test/countries/be_test.rb
      test/countries/ca_test.rb
      test/countries/de_test.rb
      test/countries/fr_test.rb
      test/countries/gb_test.rb
      test/countries/hr_test.rb
      test/countries/hu_test.rb
      test/countries/in_test.rb
      test/countries/nl_test.rb
      test/countries/pt_test.rb
      test/countries/rs_test.rb
      test/countries/se_test.rb
      test/countries/si_test.rb
      test/countries/ua_test.rb
      test/countries/us_test.rb
      test/countries/za_test.rb
    )

    s.test_files = %w(
      test/extension_test.rb
      test/phone_test.rb
      test/test_helper.rb
      test/countries/au_test.rb
      test/countries/ba_test.rb
      test/countries/be_test.rb
      test/countries/ca_test.rb
      test/countries/de_test.rb
      test/countries/fr_test.rb
      test/countries/gb_test.rb
      test/countries/hr_test.rb
      test/countries/hu_test.rb
      test/countries/in_test.rb
      test/countries/nl_test.rb
      test/countries/pt_test.rb
      test/countries/rs_test.rb
      test/countries/se_test.rb
      test/countries/si_test.rb
      test/countries/ua_test.rb
      test/countries/us_test.rb
      test/countries/za_test.rb
    )
end
