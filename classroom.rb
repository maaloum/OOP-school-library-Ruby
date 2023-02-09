require_relative 'my_student'
class Classroom
  def initialize(label)
    @label = label
  end
  attr_accessor :label

end
