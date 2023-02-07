require_relative 'baseDecorator'
class TrimmerDecorator < BaseDecorator
  def correct_name
    super()
    return super.slice(0..9) unless super.length <= 10
  end
end
