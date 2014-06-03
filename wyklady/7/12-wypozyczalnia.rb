# -*- coding: utf-8 -*-

class Movie
  attr_reader :title
  attr_accessor :price_code
  attr_writer :price

  def initialize(title, price_plan)
    @title, @price = title, price_plan
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end
end

module DefaultPrice
  def frequent_renter_points(days_rented)
    1
  end
end

class RegularPrice
  include DefaultPrice

  def charge(days_rented)
    result = 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
  end
end

class NewReleasePrice
  def frequent_renter_points(days_rented)
    days_rented > 1 ? 2 : 1
  end

  def charge(days_rented)
    days_rented * 3
  end
end

class ChildrenPrice
  include DefaultPrice

  def charge(days_rented)
    result = 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
  end
end

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def charge
    movie.charge(days_rented)
  end

  def frequent_renter_points
    movie.frequent_renter_points(days_rented)
  end
end

class Customer
  attr_reader :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element|
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end

    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{total_frequent_renter_points} frequent renter points"
    result
  end

  def html_statement
    result = "<h1>Rental Record for #{@name}</h1>\n<p>\n"

    @rentals.each do |element|
      result += element.movie.title + "\t" + element.charge.to_s + "<br>\n"
    end

    result += "<p>Amount owed is <b>#{total_charge}</b><br>\n"
    result += "You earned <em>#{total_frequent_renter_points}</em> frequent renter points.</p>"
    result
  end

  private

  def total_charge
    @rentals.inject(0) { |sum, rental| sum += rental.charge }
  end

  def total_frequent_renter_points
    @rentals.inject(0) { |sum, rental| sum += rental.frequent_renter_points }
  end

end

# Przykład użycia

movie1 = Movie.new("Milion sposobów, jak zginąć na Zachodzie", NewReleasePrice.new)
movie2 = Movie.new("Uśpieni", ChildrenPrice.new)

customer = Customer.new "Włodek"

customer.add_rental Rental.new(movie1, 4)
customer.add_rental Rental.new(movie2, 6)

puts customer.statement
