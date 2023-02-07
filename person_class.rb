class Person
  def initialize(age, parent_permission: true, name = 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_accessor :name, :age

  attr_reader :id

  def of_age?
    @age >= 18
  end
  private :of_age?
  def can_use_services?
    is_of_age? || @parent_permission
  end
end