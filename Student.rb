require "./Person.rb"

class Student < Person
  def initialize(classroom, name, age, parent_permission)
    SUPER(name, age, parent_permission )
    @classroom = classroom
  end
  def play_hooky
    "¯\(ツ)/¯"
  end

end
