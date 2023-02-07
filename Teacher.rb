require_relative 'person_class'
class Teacher < Person
  def initialize(specialization, name, age, parent_permission)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
