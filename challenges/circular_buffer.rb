class CircularBuffer
  attr_accessor :buffer, :head, :tail
  attr_reader :buffer_size

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @buffer = Array.new(buffer_size)
    @head = 0
    @tail = 0
  end

  def read
    fail BufferEmptyException if buffer.compact.empty?
    data = buffer[head]
    buffer[head] = nil
    advance_head
    data
  end

  def write(data)
    push(data) { fail BufferFullException }
  end

  def write!(data)
    push(data) do
      buffer[head] = data
      @tail = head
      advance_head
    end
  end

  def clear
    buffer.fill(nil)
  end

  private

  def push(data)
    return if data.nil?

    if buffer.all?
      yield
    end

    buffer[tail] = data
    advance_tail
  end

  def advance_head
    @head += 1
    @head = 0 if head == buffer_size
  end

  def advance_tail
    @tail += 1
    @tail = 0 if tail == buffer_size
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
