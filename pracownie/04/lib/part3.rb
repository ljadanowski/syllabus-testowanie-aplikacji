class BookInStock

  attr_accessor :isbn, :price

  def initialize(isbn, price)
    @isbn = isbn
    @price = price
  end

  def price_as_string
    "$" + "%.2f" % price
  end

end
