require "./Person.rb"

class Teacher < Person
  def initialize(specialization, name, age, parent_permission)
    SUPER(name, age, parent_permission )
    @specialization = specialization
  end
  def can_use_services?
    true
  end
end
