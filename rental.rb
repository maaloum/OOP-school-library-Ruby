class Rental
  def initialize(date, book, person )
    @date = date
    @book = book
    @person = person
  end
  attr_accessor :date
  belongs-to :Book, :Person

end
