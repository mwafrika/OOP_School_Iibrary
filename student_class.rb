require './person_class'

class Student < Person
  def initialize(classroom, name = 'Unknown', parent_permission: true)
    super(12, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

# testing
play = Student.new('classroom 1')
print play.play_hooky
