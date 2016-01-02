class Triplet
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a**2 + b**2 == c**2
  end

  def self.where(options={})
    max = options[:max_factor] || 10
    min = options[:min_factor] || 1
    sum = options[:sum]
    combos = (min..max).to_a.combination(3).to_a
    result = []

    combos.each do |combo|
      triplet = Triplet.new(*combo)
      next unless triplet.pythagorean?

      if sum
        result << triplet if triplet.sum == sum
      else
        result << triplet
      end
    end

    result
  end
end
