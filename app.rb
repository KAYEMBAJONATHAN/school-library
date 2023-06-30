require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :books, :person, :rentals, :classroom

  def initialize
    @books = []
    @person = []
    @rentals = []
  end

  def list_all_books
    puts 'All Books:'
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}, #{book.id}"
    end
  end

  def list_all_people
    puts 'All People:'
    @person.each do |person|
      puts "UserId: #{person.id}, #{person.class}, Name: #{person.name}, Age: #{person.age}"

      puts "Specialization: [#{person.specialization}]" if person.instance_of?(Teacher)
    end
  end

  def create_person
    puts 'Press 1 for student, 2 for teacher:'
    is_student = gets.chomp.to_i
    puts 'Enter person name:'
    name = gets.chomp
    puts 'Enter person age:'
    age = gets.chomp.to_i

    case is_student
    when 1
      print 'Does the student have parent permission? [Y/N]: '
      permission = gets.chomp.downcase == 'y'
      student = Student.new(name, 1, age, permission)
      @person << student
    when 2
      print 'What is the teacher\'s specialization? '
      specialization = gets.chomp
      teacher = Teacher.new(name, specialization, age)
      @person << teacher
    else
      puts 'Invalid input'
      return
    end

    puts 'Person created successfully.'
  end

  def create_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
  end

  def create_rental
    puts 'Select book by number:'
    @books.each_with_index do |book, index|
      puts "boodIndex #{index}"
      puts "#{index} - Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts 'Select person by number:'
    @person.each_with_index do |person, index|
      puts "#{index} - #{person.class}, Name: #{person.name}"
    end

    person_index = gets.chomp.to_i
    puts 'Enter date:'
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @person[person_index])
    @rentals << rental
    puts 'Rental created successfully.'
  end

  def list_rentals_for_person
    puts 'All IDs:'
    @rentals.each do |rental|
      puts "#{rental.person.id}, Name: #{rental.person.name}"
    end
    puts 'Select ID:'
    id = gets.chomp

    puts 'All Rentals for this ID:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Title: #{rental.book.title}, Author: #{rental.book.author}, Date: #{rental.date}"
      else
        puts 'Rental not found.'
      end
    end
  end
end
