# rubocop:disable Style/CyclomaticComplexity
require './book'
require './person_class'
require './teacher_class'
require './student_class'
require './rental'
require 'json'

class Library
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      print 'No books in library'
      return
    end
    @books.collect { |book| puts "Title: #{book[:title]}, Author: #{book[:author]}" }
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    book = Book.new(title: title, author: author)
    # @books << book
    @books << { title: book.title, author: book.author }
    save_book = JSON.generate(@books)
    File.write('./books.json', save_book.to_s)
    puts "Book created successfully\n"
  end

  def list_all_people
    if @people.empty?
      puts 'Your Library is empty'
      return
    end
    @people.collect { |person| puts "Name: #{person[:name]}, ID: #{person[:id]}, Age: #{person[:age]}\n" }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '

    option = gets.chomp

    case option
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Classroom:'
      classroom = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permission_resp = gets.chomp
      parent_permission = permission_resp.downcase == 'y'

      student = Student.new(age: age, classroom: classroom, name: name, parent_permission: parent_permission)
      # @people.push(student)
      print student.class
      @people << { age: student.age, classroom: student.classroom, name: student.name, id: student.id }
      save_teacher = JSON.generate(@people)
      File.write('./people.json', save_teacher.to_s)
      puts "Person created successfuly\n"
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp

      teacher = Teacher.new(age: age, specialization: specialization, name: name)
      # @people.push(teacher)
      @people << { age: teacher.age, name: teacher.name, id: teacher.id }
      save_teacher = JSON.generate(@people)
      File.write('./people.json', save_teacher.to_s)
      puts "Person created successfuly\n"

    else
      puts 'Please choose number 1 or 2'
      nil
    end
  end

  def create_rental
    if @people.empty? && @books.empty?
      puts 'Your Library is empty'
      return
    end
    puts 'Select a book by number'
    @books.each_with_index do |book, i|
      print "#{i}) Title: #{book[:title]}, Author: #{book[:author]}\n"
      print book.class
    end

    book_index = gets.chomp.to_i
    book = @books[book_index]

    puts 'Select a person by number'
    @people.each_with_index do |person, i|
      print "#{i}) [#{person.class}] Name: #{person[:name]}, ID: #{person[:id]}, Age: #{person[:age]}\n"
    end

    person_index = gets.chomp.to_i
    person = @people[person_index]

    print "\nDate: "

    date = gets.chomp

    rental = Rental.new(date: date, person: person, book: book)
    # @rentals << rental
    @rentals << { date: rental.date, person: rental.person, book: rental.book }
    save_rental = JSON.generate(@rentals)
    File.write('./rentals.json', save_rental.to_s)
    puts "Rental created successfully\n"
  end

  def list_all_rental
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals: '

    rentals = @rentals.select { |rental| rental.person.id == id }

    if rentals.empty?
      puts 'No rentals found'
      return
    end

    rentals.each do |rental|
      print "Date: #{rental[:date]}, Book \'#{rental[:book.title]}\' by #{rental[:book.author]}\n"
    end
  end
end

def main
  puts "Welcome to Library App!\n\n "
  response = nil
  app = Library.new
  file = File.open('./books.json')
  file.readlines.map(&:chomp)
  # File.read("./people.json").split

  while response != '7'
    puts 'Please choose an option below :'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    response = gets.chomp

    puts "\n"

    case response
    when '1'
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_all_rental
    when '7'
      puts 'Exit'
    end
    puts "\n"
  end
end

main
# rubocop:enable Style/CyclomaticComplexity
