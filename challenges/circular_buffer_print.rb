require_relative 'circular_buffer'

class Visualizer
  attr_accessor :buffer

  def run
    test_alternate_read_and_write_into_buffer_overflow
  end

  def display
    sleep(1)
    system 'clear'
    print @buffer.buffer
  end

  def test_alternate_read_and_write_into_buffer_overflow
    begin
      @buffer = CircularBuffer.new(5)
      ('1'..'3').each do
        |i| @buffer.write i
        display
      end
      2.times do
        buffer.read
        display
      end
      buffer.write '4'
      display
      buffer.read
      display
      ('5'..'8').each do
        |i| buffer.write i
        display
      end
      buffer.write! 'A'
      display
      buffer.write! 'B'
      display
      ('6'..'8').each do |i|
        buffer.read
        display
      end
      2.times do
        buffer.read
        display
      end
      buffer.read
    rescue Exception => ex
      sleep(1)
      system 'clear'
      print ex.class
    end
  end
end

Visualizer.new.run