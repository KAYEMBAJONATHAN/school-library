require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name, _parent_permission)
    super(name, age)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
