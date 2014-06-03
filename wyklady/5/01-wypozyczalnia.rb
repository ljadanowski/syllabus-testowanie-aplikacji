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
end

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element|
      this_amount = amount_for(element) # case extracted and replaced with amount_for

      frequent_renter_points += 1
      if element.movie.price_code = Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end

  # w oryginalnym kodzie zmieniamy nazwy zmiennych:
  #   element -> rental, this_amount -> result
  def amount_for(rental)
    result = 0

    case rental.movie.price_code
    when Movie::REGULAR
      result += 2
      result += (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
    when Movie::NEW_RELEASE
      result += rental.days_rented * 3
    when Movie::CHILDRENS
      result += 1.5
      result += (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
    end
  end

end

# Przykład użycia

movie1 = Movie.new("Milion sposobów, jak zginąć na Zachodzie", Movie::NEW_RELEASE)
movie2 = Movie.new("Uśpieni", Movie::CHILDRENS)

customer = Customer.new "Włodek"

customer.add_rental Rental.new(movie1, 4)
customer.add_rental Rental.new(movie2, 6)

puts customer.statement
