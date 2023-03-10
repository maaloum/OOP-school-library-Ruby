require_relative 'nameable'
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  attr_accessor :name, :age, :rentals

  attr_reader :id

  def of_age?
    @age >= 18
  end
  private :of_age?
  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent(date, book)
    Rental.new(date, book, self)
  end
end
