class Octal
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    n = 0
    sum = 0
    num.each_char.map(&:to_i).reverse.each do |digit|
      sum += digit*8**n
      n += 1
    end
    sum
  end
end