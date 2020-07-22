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
    [
      '+7-902-423-4233', '+5-332-523-4452',
      '+5-332523-4452', '+53325234452', '+53223325234452',
      '+5322-332-523-4452'
    ].each do |number|
      assert Person.new(number).valid?
    end
  end

  def test_invalid_numbers
    [
      123,'123456789', '123--456-7890', '12345678x1', '123-123-1234',
      '1234567890', '+0-332523-4452', '+-332523-4452', '+532823325234452',
      '+53228-332-523-4452'
    ].each do |number|
      assert !Person.new(number).valid?
    end
  end
end
