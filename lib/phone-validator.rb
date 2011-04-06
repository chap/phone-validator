class PhoneValidator < ActiveModel::EachValidator
  # validate 10 digit numbers
  # optionally seperated by dashes
  # 123-456-7890
  # 1234567890

  def validate_each(record, attribute, value)
    unless value =~ /^[0-9]{3}-?[0-9]{3}-?[0-9]{4}$/
      record.errors[attribute] << (options[:message] || "is not valid") 
    end
  end
end