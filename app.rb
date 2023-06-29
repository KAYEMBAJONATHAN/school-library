require_relative 'teacher'
require_relative 'book'
require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'rental'

class App
  attr_reader :books, :person, :rentals, :classroom

  def initialize
    @books = []
    @person = []
    @rentals = []
  end
end
