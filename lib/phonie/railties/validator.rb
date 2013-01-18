I18n.load_path += Dir.glob( File.expand_path('../locales/*.{rb,yml}', __FILE__) )

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    return if value.blank?
    phone = Phonie::Phone.parse(value)

    if phone.nil?
      object.errors.add(attribute, :invalid_phone_number)
    else
      formated = phone.format( phone.extension ? :default_with_extension : :default)
      object.send("#{attribute}=", formated) if object.respond_to?("#{attribute}=")
    end
  end
end