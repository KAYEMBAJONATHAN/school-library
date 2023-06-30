class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author)
    @id = SecureRandom.hex(4)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
  end
end
