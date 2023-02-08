class Book

  def initialize(title, author)
    @title = title
    @author = author
  end
  attr_accessor :title, :author
  has_many :Rental
end
