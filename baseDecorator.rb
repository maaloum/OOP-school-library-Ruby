require_relative 'nameable'
class BaseDecorator < Nameable
  attr_accessor :nemeable
  def initialize (nemeable )
    @nameable =nemeable
  end
  def correct_name
    @nemeable.correct_name
  end
end
