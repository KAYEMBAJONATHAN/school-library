require_relative 'nameable'
require_relative 'person'

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    super()
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    super()
    @nameable.correct_name.slice(0, 10)
  end
end

person = Person.new(17, 'maximilianus', parent_permission: true)

capitalize_decorator = CapitalizeDecorator.new(person)

puts capitalize_decorator.correct_name

trimmer_decorator = TrimmerDecorator.new(person)

puts trimmer_decorator.correct_name