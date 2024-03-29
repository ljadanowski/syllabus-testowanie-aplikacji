# -*- coding: utf-8 -*-

class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end
end

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def charge
    result = 0
    case movie.price_code
    when Movie::REGULAR
      result += 2
      result += (days_rented - 2) * 1.5 if days_rented > 2
    when Movie::NEW_RELEASE
      result += days_rented * 3
    when Movie::CHILDRENS
      result += 1.5
      result += (days_rented - 3) * 1.5 if days_rented > 3
    end
    # puts "rental charge: #{result}"
    result
  end

  def frequent_renter_points
    (movie.price_code == Movie::NEW_RELEASE && days_rented > 1) ? 2 : 1
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
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element|
      frequent_renter_points += element.frequent_renter_points
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end

    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end

  private

  # to nie jest prosty przypadek eliminacji zmiennej tymczasowej
  # def total_charge
  #   result = 0
  #   @rentals.each do |element|
  #     result += element.charge
  #   end
  #   result
  # end
  def total_charge
    @rentals.inject(0) { |sum, rental| sum += rental.charge }
  end

end

# Przykład użycia

movie1 = Movie.new("Milion sposobów, jak zginąć na Zachodzie", Movie::NEW_RELEASE)
movie2 = Movie.new("Uśpieni", Movie::CHILDRENS)

customer = Customer.new "Włodek"

customer.add_rental Rental.new(movie1, 4)
customer.add_rental Rental.new(movie2, 6)

puts customer.statement
