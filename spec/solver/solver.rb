class Solver
  def factorial(number)
    numb = number.to_i
    raise RangeError, 'Number should not be negative' if numb.negative?

    numb == 0 ? 1 : numb * factorial(numb - 1)
  end

  def reverse(word)
    word.reverse.to_s
  end

  def fizzbuzz(number)
    numb = number.to_i
    if numb % 3 == 0 && numb % 5 == 0
      'fizzbuzz'
    elsif numb % 3 == 0
      'fizz'
    elsif numb % 5 == 0
      'buzz'
    else
      numb
    end
  end
end

solver = Solver.new

print solver.fizzbuzz('hello')
