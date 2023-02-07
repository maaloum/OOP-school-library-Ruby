require_relative 'baseDecorator'
class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.correct_name.size == 10? correct_name : correct_name.strip
    end
  end
end
