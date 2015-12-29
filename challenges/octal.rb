class Octal
  attr_reader :octal

  def initialize(octal)
    @octal = octal
    @digits = octal.each_char.map(&:to_i).reverse
  end

  def to_decimal
    sum = 0

    if valid_octal?
      @digits.each_with_index { |digit, n| sum += digit * 8**n }
    end

    sum
  end

  def valid_octal?
    octal =~ /^[0-7]*$/
  end
end
