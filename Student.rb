require './Person'
class Student < Person
  def initialize(classroom, name, age, parent_permission)
    super(name, age, parent_permission)
    @classroom = classroom
  end
  def play_hooky
    "¯\(ツ)/¯"
  end
end
