class Luhn
  attr_reader :num

  def initialize(num)
    @digits = num.to_s.chars.map(&:to_i)
  end

  def addends
    @digits.reverse!.map!.with_index do |digit, i|
      digit *= 2 if i.odd?
      digit -= 9 if digit >= 10
      digit
    end
    @digits.reverse!
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    num_checksum = new(num * 10).checksum
    luhnifier = num_checksum % 10 == 0 ? 0 : 10 - (num_checksum % 10)
    num * 10 + luhnifier
  end
end
