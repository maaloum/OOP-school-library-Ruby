require_relative 'my_student'
require_relative 'my_teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @cmd = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'create a person',
      '4' => 'create a book',
      '5' => 'create a rent',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }
    @books = []
    @people = []
  end

  def display_cmd
    @cmd.each do |index, command|
      puts "#{index} - #{command}"
    end
  end

  def list_all_books
    if @books.empty?
      puts 'No books have yet been created!'
    else
      @books.each_with_index do |book, index|
        puts "#{index}. Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No person added to the system'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_all_people_with_index
    @people.each_with_index do |person, index|
      puts "#{index}. [#{person.class}] Name: #{person.name}, ID #{person.id}, Age: #{person.age}"
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase

    case permission
    when 'y'
      parent_permission = true
    when 'n'
      parent_permission = false
    end

    @people.push(Student.new('11', age, name, parent_permission: parent_permission))
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @people.push(Teacher.new(specialization, age, name))
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    end

    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))

    puts 'Book Created Successfully'
  end

  def create_rental()
    puts 'Select a book from the following list by number'
    list_all_books

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    list_all_people_with_index

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    Rental.new(date, @books[book_index], @people[person_index])

    puts 'Rental created successfully'
  end

  def list_all_rental
    puts 'All people in the system'
    list_all_people
    print 'Id of the person: '
    id = gets.chomp.to_i
    person_array = @people.select { |person| person.id == id }

    if person_array.empty?
      puts 'No person matches the given ID!'
    else
      person = person_array[0]
      if person.rentals.empty?
        puts 'This person does not have any rentals'
      else
        person_array[0].rentals.each do |rental|
          puts "Date #{rental.date}, Book: #{rental.book.title} Author: #{rental.book.author}"
        end
      end
    end
  end

  def choose_option(input)
    case input
    when '1' then list_all_books
    when '2' then list_all_people
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then list_all_rental
    end
  end

  def exit_option
    input = gets.chomp
    if input == '7'
      exit
    else
      choose_option(input)
    end
  end

  def run
    puts 'Please choose an option to start'
    display_cmd
    exit_option
  end
end
