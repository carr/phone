# phone

![Travis badge](https://api.travis-ci.org/carr/phone.svg)
![CodeClimate badge](https://codeclimate.com/github/carr/phone.png)

Parsing, validating and creating phone numbers

* [Homepage](https://github.com/carr/phone#readme)
* [Issues](https://github.com/carr/phone/issues)
* [Documentation](http://rubydoc.info/gems/phone/frames)
* [Email](mailto:don at elskwid.net)

## Version

This documentation is for the unreleased development branch. The current stable version is [1.2.3](https://github.com/carr/phone/tree/v1.2.3)

## Description

TODO: Description

## Features

### Automatic country and area code detection

Phone does its best to automatically detect the country and area code while parsing. To do this, phone uses data stored in `data/phone/countries.yml`.

Each country code can have a regular expression named `area_code` that describes what the area code for that particular country looks like.

If an `area_code` regular expression isn't specified, the default, `Phoner::Phone::DEFAULT_AREA_CODE` (correct for the US) is used.

### Validating

Validating is very relaxed, basically it strips out everything that's not a number or '+' character:

```ruby
Phoner::Phone.valid? 'blabla 091/512-5486 blabla'
```

### Formatting

Formating is done via the `#format` method. The method accepts a `Symbol` or a `String`.

When given a string, it interpolates the string with the following fields:

* %c - country_code (385)
* %a - area_code (91)
* %A - area_code with leading zero (091)
* %n - number (5125486)
* %f - first @@n1_length characters of number (configured through Phoner::Phone.n1_length), default is 3 (512)
* %l - last characters of number (5486)
* %x - the extension number

```ruby
pn = Phoner::Phone.parse('+385915125486')
pn.to_s # => "+385915125486"
pn.format("%A/%f-%l") # => "091/512-5486"
pn.format("+ %c (%a) %n") # => "+ 385 (91) 5125486"
```

When given a symbol it is used as a lookup for the format in the <tt>Phoner::Phone.named_formats</tt> hash.

```ruby
pn.format(:europe) # => "+385 (0) 91 512 5486"
pn.format(:us) # => "(234) 123 4567"
pn.format(:default_with_extension) # => "+3851234567x143"
```

You can add your own custom named formats like so:

```ruby
Phoner::Phone.named_formats[:short] = '%A/%n1-%n2'
pn.format(:short) # => 091/512-5486
```

### Finding countries by their isocode

If you don't have the country code, but you know from other sources what country a phone is from, you can retrieve the country using the country isocode (such as 'de', 'es', 'us', ...). Remember to call `Phoner::Country.load` before using this lookup.

```ruby
if country = Phoner::Country.find_by_country_isocode(user_country_isocode)
  phone_number = Phoner::Phone.parse(user_input, :country_code => country.country_code)
end
```

## Examples

```ruby
require 'phone'
```

### Initializing

Initialize a new phone object with the number, area code, country code and extension number:

```ruby
Phoner::Phone.new('5125486', '91', '385')
```

```ruby
Phoner::Phone.new(:number => '5125486', :area_code => '91', :country_code => '385', :extension => '143')
```

### Parsing

Create a new phone object by parsing from a string. Phoner::Phone does it's best to detect the country and area codes:

```ruby
Phoner::Phone.parse '+385915125486'
Phoner::Phone.parse '00385915125486'
```

If the country or area code isn't given in the string, you must set it, otherwise it doesn't work:

```ruby
Phoner::Phone.parse '091/512-5486', :country_code => '385'
Phoner::Phone.parse '(091) 512 5486', :country_code => '385'
```

If you feel that it's tedious, set the default country code once:

```ruby
Phoner::Phone.default_country_code = '385'
Phoner::Phone.parse '091/512-5486'
Phoner::Phone.parse '(091) 512 5486'
```

Same goes for the area code:

```ruby
Phoner::Phone.parse '451-588', :country_code => '385', :area_code => '47'
```
or

```ruby
Phoner::Phone.default_country_code = '385'
Phoner::Phone.default_area_code = '47'

Phoner::Phone.parse '451-588'
```

## Test Countries

* [AU] Australia
* [BA] Bosnia and Herzegovina
* [BE] Belgium
* [DE] Germany
* [ES] Spain
* [FR] France
* [GB] United Kingdom
* [HR] Croatia
* [HU] Hungary
* [IE] Ireland
* [NL] Netherlands
* [NZ] New Zealand
* [RS] Serbia
* [SE] Sweden
* [SI] Slovenia
* [UA] Ukraine
* [US] United States
* [ZA] South Africa

## Known issues

There's an issue with Germany and Spanish area codes.

## Requirements


## Install

    $ gem install phone

Or as a Rails plugin

    $ script/plugin install git://github.com/carr/phone.git

## Copyright

Copyright (c) 2010-2013 Tomislav Car, [Infinum](http://www.infinum.co)
Copyright (c) 2013 Don Morrison

See [LICENSE.txt](LICENSE.txt) for details.

## Contributors

Don Morrison, Michael Squires, Todd Eichel (Fooala, Inc.), chipiga, Etienne Samson, Luke Randall, Jakob Hilden, Tieg Zaharia
