class Classroom
  attr_accessor :label
  attr_reader :students, :id

  def initialize(label)
    @id = SecureRandom.hex(4)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
