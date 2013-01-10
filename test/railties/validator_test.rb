require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

require 'active_model'
require 'phonie/railties/validator'
class SomeModel < Struct.new(:phone)
  include ActiveModel::Validations
  validates :phone, phone: true
end


class PhoneValidatorTest < Phonie::TestCase
  def test_blank_phone
    assert SomeModel.new(nil).valid?
    assert SomeModel.new('').valid?
  end

  def test_valid_model
    model = SomeModel.new('+1 251 123 4567')
    assert model.valid?

    assert model.phone == '+12511234567'
  end

  def test_invalid_model
    model = SomeModel.new('+1 251 123 456')
    assert model.invalid?
    assert !model.errors[:phone].empty?
  end
end
