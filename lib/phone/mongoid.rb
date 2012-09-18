# Mongoid serialization support for Phone type.

# simply include Mongoid::Fields
module Mongoid
  module Fields
    class Phone
      include Mongoid::Fields::Serializable
    
      def self.instantiate(name, options = {})
        super
      end

      # Deserialize a Phone given the hash stored by Mongodb
      #
      # @param [Hash] Phone as hash
      # @return [Phone] deserialized Phone
      # :country_code, :area_code, :number, :extension
      def deserialize(hash)
        return if !hash
        Phoner::Phone.new country_code: country_code(hash), 
                    area_code:    area_code(hash),
                    number:       hash[:number], 
                    extension:    hash[:extension]
      end

      # Serialize a Phone or a Hash as a BSON serializable type.
      #
      # @param [Phone, Hash] value
      # @return [Hash] phone
      def serialize(value)
        return if value.blank?
        phone = case value
        when Phoner::Phone
          value
        else
          Phoner::Phone.new(value)
        end
        {
          country_code: phone.country_code, area_code: phone.area_code,
          number:       phone.number,       extension: phone.extension
        }
      end

      protected

      def country_code
        hash[:country_code] || Phoner::Phone.default_country_code
      end

      def area_code
        hash[:area_code] || default_area_code
      end
    end
  end
end
