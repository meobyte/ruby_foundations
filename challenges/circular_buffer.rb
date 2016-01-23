class CircularBuffer
  attr_accessor :buffer, :head, :tail
  attr_reader :buffer_size

  def initialize(buffer_size)
    @buffer_size = buffer_size
    clear
  end

  def read
    fail BufferEmptyException if @buffer.compact.empty?
    data = buffer[head]
    buffer[head] = nil
    advance_head
    data
  end

  def write(data)
    return if data.nil?
    fail BufferFullException if @buffer.all?
    buffer[tail] = data
    advance_tail
  end

  def write!(data)
    return if data.nil?
    if @buffer.all?
      buffer[head] = data
      @tail = head
      advance_head
    else
      buffer[tail] = data
      advance_tail
    end
  end

  def clear
    @buffer = Array.new(buffer_size)
    @head = 0
    @tail = 0
  end

  def advance_head
    @head += 1
    @head = 0 if @head == buffer_size
  end

  def advance_tail
    @tail += 1
    @tail = 0 if @tail == buffer_size
  end

  BufferEmptyException = Class.new(StandardError)
  BufferFullException = Class.new(StandardError)
end
