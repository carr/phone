module Phoner
  class PhoneError < RuntimeError;end
  class BlankNumberError < PhoneError;end
  class AreaCodeError < PhoneError;end
  class CountryCodeError < PhoneError;end
end
