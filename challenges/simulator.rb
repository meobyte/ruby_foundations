class Robot
  attr_accessor :bearing
  attr_reader :coordinates

  def initialize
    @bearing = :north
    @directions = [:north, :east, :south, :west]
    @coordinates = [0, 0]
  end

  def orient(direction)
    unless @directions.include?(direction)
      fail ArgumentError, 'Must be :north, :south, :east, or :west'
    end
    @bearing = direction
  end

  def turn_right
    next_index = @directions.find_index(bearing) + 1
    next_index = 0 if next_index == @directions.size
    @bearing = @directions[next_index]
  end

  def turn_left
    prev_index = @directions.find_index(bearing) - 1
    @bearing = @directions[prev_index]
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    x = @coordinates[0]
    y = @coordinates[1]
    case @bearing
    when :north
      at(x, y + 1)
    when :east
      at(x + 1, y)
    when :south
      at(x, y - 1)
    when :west
      at(x - 1, y)
    end
  end
end

class Simulator
  def instructions(key_codes)
    commands = []
    key_codes.each_char do |command|
      case command
      when 'L'
        commands << :turn_left
      when 'R'
        commands << :turn_right
      when 'A'
        commands << :advance
      end
    end
    commands
  end

  def place(robot, options)
    robot.orient(options[:direction])
    robot.at(options[:x], options[:y])
  end

  def evaluate(robot, key_codes)
    instructions(key_codes).each do |instruction|
      case instruction
      when :turn_left
        robot.turn_left
      when :turn_right
        robot.turn_right
      when :advance
        robot.advance
      end
    end
  end
end
