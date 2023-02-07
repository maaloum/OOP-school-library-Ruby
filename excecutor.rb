require_relative 'person'
require_relative './capitalizeDecorator '
require_relative 'trimmerDecorator'

person = Person.new(22, 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmedPerson = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmedPerson.correct_name
