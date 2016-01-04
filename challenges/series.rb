class Series
  def initialize(numbers)
    @numbers = numbers.each_char.map(&:to_i)
  end

  def slices(slice_size)
    unless slice_size <= @numbers.size
      fail ArgumentError, 'Slice must be smaller than series'
    end

    @numbers.each_cons(slice_size).map(&:to_a)
  end
end
