require_relative 'rental'
require 'pry'

class Book
  attr_accessor :title, :author, :rentals
  binding.pry
  def initialize(title:, author:)

    @title = title
    @author = author
    @rentals = []
  end

  # Added
  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
