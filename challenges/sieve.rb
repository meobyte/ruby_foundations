class Sieve
  attr_reader :range

  def initialize(limit)
    @range = (2..limit).to_a
  end

  def primes
    range.each do |prime|
      range.reject! { |num| (num != prime) && (num % prime == 0) }
    end
    range
  end
end