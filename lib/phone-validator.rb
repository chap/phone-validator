class PhoneValidator < ActiveModel::EachValidator
  # validate 10 digit numbers with country code
  # optionally seperated by dashes

  def validate_each(record, attribute, value)
    unless value =~ /^\+{1}[1-9]{1,4}-?[0-9]{3}-?[0-9]{3}-?[0-9]{4}$/
      record.errors[attribute] << (options[:message] || "is not valid")
    end
  end
end
