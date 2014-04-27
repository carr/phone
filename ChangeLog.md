# 1.3.0 / (unreleased)

* Update README for yaml name and location (pepe)
* Relocate / rename `data/phone_countries.yml` to `data/phone/countries.yml` (elskwid)
* [improvement] Add modern gem infrastructure - add bundler, update gemspec, convert to minitest, locate gem files in proper directories, add .ruby-version, update README, update LICENSE.txt, add Changelog.md. (elskwid)
* [improvement] Memoize country code regex. (tiegz)
* [improvement] Update regex for: ZA, UY, NL, BE, FR, HU, PT, UA, RS, HR, SE, SI, and BA. (g1smd)
* [improvement] Add IE support. (dramalho)
* [improvement] Update #split_to_parts to provide a format override and handle nil parts. (dramalho)
* [improvement] Add NZ support. (jurgens)
* [improvement] Add options support to `#valid?`. (soulcutter)
* [improvement] Remove need for `cattr_accessor`. (elskwid)
* [fix] Incorrect error raised when missing phone number and add missing test. (elskwid)
* [fix] Fix extension handling in `::parse`. (elskwid)
* [improvement] Remove need for ActiveSupport detection. (elskwid)
* [improvement] Remove monkeypatching support library. (elskwid)
* [improvement] Add support for Travis CI. (elskwid)

# 1.2.3 / 2013-11-16

* [fix] Bring changes from v1.1 that were mysteriously missing from repo. (elskwid)
  - README updates
  - Spain area code updates
  - Support 3 character codes for countries
  - Update default area code
  - Update `::normalize`

# 1.2.2 / 2013-11-15

* Add license to gemspec. (bf4)

# 1.2.1 / 2013-10-24

* Add errors.rb to gemspec to fix gem. (mtarnovan)

#  1.2 / 2013-10-23 (yanked)

* Released to capture updates made after version 1.1. (elskwid)
* Add specific exception classes. (miloshadzic)

# 1.1 / 2011-06-23

* Implement `==`. (haxney and carr)
* Update Uraguay area codes and tests. (tiegz)

# 1.0 / 2011-04-04

* Namespaced library as `Phoner::Phone` (carr)

# Previous versions ...
