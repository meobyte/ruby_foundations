class School
  attr_reader :roster

  def initialize
    @roster = Hash.new{ |roster, grade| roster[grade] = [] }
  end

  def add(student, grade)
    roster[grade] << student
  end

  def grade(num)
    roster[num]
  end

  def to_h
    roster.sort.map { |grade, list| [grade, list.sort] }.to_h
  end
end
