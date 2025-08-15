[gem]: https://rubygems.org/gems/phone
[stable]: https://github.com/carr/phone/tree/v1.2.3
[gem-beta]: https://rubygems.org/gems/phone/versions/1.3.0.beta1
[beta]: https://github.com/carr/phone/tree/v1.3.0.beta1/
[ci]: https://github.com/carr/phone/actions/workflows/ci.yml

# phone

[![Beta Gem Version](https://img.shields.io/badge/beta-v1.3.0.beta1-blue.svg)][gem-beta]
[![Gem Version](https://img.shields.io/gem/v/phone.svg)][gem]
[![Build Status](https://github.com/carr/phone/actions/workflows/ci.yml/badge.svg)][ci]

Parsing, validating and creating phone numbers

* [Homepage](https://github.com/carr/phone#readme)
* [Issues](https://github.com/carr/phone/issues)
* [Documentation](http://rubydoc.info/gems/phone/frames)
* [Email](mailto:don at elskwid.net)

## Version

This documentation is for the unreleased development branch.

* Current release: [1.3.0.beta1][beta]
* Current stable: [1.2.3][stable]

## Description

Ruby library for phone number parsing, validation, and formatting.

## Features

### Automatic country and area code detection

Phone does its best to automatically detect the country and area code while parsing. To do this, phone uses data stored in `data/phone/countries.yml`.

Each country code can have a regular expression named `area_code` that describes what the area code for that particular country looks like.

If an `area_code` regular expression isn't specified, a default value which is considered correct for the US will be used.

If your country has phone numbers longer that 8 digits - exluding country and area code - you can specify that within the country's configuration in `data/phone/countries.yml`

### Validating

Validating is very relaxed, basically it strips out everything that's not a number or '+' character:

```ruby
Phoner::Phone.valid? 'blabla 091/555-4488 blabla'
```

### Formatting

Formating is done via the `#format` method. The method accepts a `Symbol` or a `String`.

When given a string, it interpolates the string with the following fields:

* %c - country_code (385)
* %a - area_code (91)
* %A - area_code with leading zero (091)
* %n - number (5554488)
* %f - first @@n1_length characters of number (configured through Phoner::Phone.n1_length), default is 3 (555)
* %l - last characters of number (4488)
* %x - the extension number

```ruby
pn = Phoner::Phone.parse('+385915554488')
pn.to_s # => "+385915554488"
pn.format("%A/%f-%l") # => "091/555-4488"
pn.format("+ %c (%a) %n") # => "+ 385 (91) 5554488"
```

When given a symbol it is used as a lookup for the format in the <tt>Phoner::Phone.named_formats</tt> hash.

```ruby
pn.format(:europe) # => "+385 (0) 91 555 4488"
pn.format(:us) # => "(234) 123-4567"
pn.format(:default_with_extension) # => "+3851234567x143"
```

You can add your own custom named formats like so:

```ruby
Phoner::Phone.named_formats[:short] = '%A/%n1-%n2'
pn.format(:short) # => 091/555-4488
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
Phoner::Phone.new('5554488', '91', '385')
```

```ruby
Phoner::Phone.new(:number => '5554488', :area_code => '91', :country_code => '385', :extension => '143')
```

### Parsing

Create a new phone object by parsing from a string. Phoner::Phone does it's best to detect the country and area codes:

```ruby
Phoner::Phone.parse '+385915554488'
Phoner::Phone.parse '00385915554488'
```

If the country or area code isn't given in the string, you must set it, otherwise it doesn't work:

```ruby
Phoner::Phone.parse '091/555-4488', :country_code => '385'
Phoner::Phone.parse '(091) 555 4488', :country_code => '385'
```

If you feel that it's tedious, set the default country code once:

```ruby
Phoner::Phone.default_country_code = '385'
Phoner::Phone.parse '091/555-4488'
Phoner::Phone.parse '(091) 555 4488'
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

## Adding and maintaining countries

From time to time, the specifics about your countries information may change. You can add or update your countries configuration by editing `data/phone/countries.yml`

The following are the available attributes for configuration:

* `country_code`: Required. A string representing your country's international dialling code. e.g. "123"
* `national_dialing_prefix`: Required. A string representing your default dialling prefix for national calls. e.g. "0"
* `char_3_code`: Required. A string representing a country's ISO code. e.g. "US"
* `name`: Required. The name of the country. e.g. "Denmark"
* `international_dialing_prefix`: Required. The dialling prefix a country typically uses when making international calls. e.g. "0"
* `area_code`: Optional. A regular expression detailing valid area codes. Default: "\d{3}" i.e. any 3 digits.
* `max_num_length`: Optional. The maximum length of a phone number after country and area codes have been removed. Default: 8

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
* [ME] Montenegro
* [NL] Netherlands
* [NZ] New Zealand
* [PT] Portugal
* [RS] Serbia
* [SE] Sweden
* [SI] Slovenia
* [UA] Ukraine
* [US] United States
* [UY] Uruguay
* [ZA] South Africa

## Known issues

There's an issue with Germany and Spanish area codes.

## Requirements


## Install

    $ gem install phone

Or as a Rails plugin, in your Gemfile

    gem 'phone'

And then `bundle install` from your command line.

## Copyright

Copyright (c) 2010-2013 Tomislav Car, [Infinum](http://www.infinum.co)
Copyright (c) 2013 Don Morrison

See [LICENSE.txt](LICENSE.txt) for details.

## Contributors

Don Morrison, Michael Squires, Todd Eichel (Fooala, Inc.), chipiga, Etienne Samson, Luke Randall, Jakob Hilden, Tieg Zaharia
