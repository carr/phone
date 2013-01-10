class PhoneValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    return if value.blank?
    phone = Phonie::Phone.parse(value)

    if phone.nil?
      object.errors.add(attribute, :invalid_phone)
    else
      object.send("#{attribute}=", phone.format(:default)) if object.respond_to?("#{attribute}=")
    end
  end
end