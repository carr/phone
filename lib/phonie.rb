require "phonie/version"
require "phonie/support" unless defined? ActiveSupport
require "phonie/phone"
require "phonie/country"
require "phonie/railties/validator" if defined? ActiveModel

module Phonie
end
