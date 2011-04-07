require 'helper'

class TestPhoneValidator < Test::Unit::TestCase

  class Person
    include ActiveModel::Validations

    validates :phone, :phone => true

    attr_accessor :phone
    def initialize(phone)
      @phone = phone
    end
  end
  
  
  def test_valid_numbers
    ['123-123-1234', '1234567890'].each do |number|
      assert Person.new(number).valid?
    end
  end

  def test_invalid_numbers
    [123, '123456789', '123--456-7890', '12345678x1'].each do |number|
      assert !Person.new(number).valid?
    end
  end
end
