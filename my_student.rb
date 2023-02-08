require_relative 'my_person'
require_relative 'classroom'
class Student < Person
  def initialize(classroom, name, age, parent_permission)
    super(name, age, parent_permission)
    @classroom = classroom
  end
  belongs-to :classroom
  def play_hooky
    '¯\(ツ)/¯'
  end
end
