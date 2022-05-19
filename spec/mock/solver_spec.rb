# Create a method called factorial that takes one argument, an integer N,
# and returns the factorial for that number. The factorial is the multiplication of all integers
# from 1 to N and has the special case that the factorial of 0 is 1. This method only accepts 0 and positive integers,
# so if a negative integer is given it should raise an exception.

require_relative 'solver'

describe 'Should test the solver funtcionss' do
  context 'Should test all the functions in the Solver class' do
    it 'should return the factorial of the number' do
      solver = Solver.new
      expect(solver.factorial(5)).to eq 120
    end
    it 'should raise an exception if the number is not an integer' do
      solver = Solver.new
      expect(solver.factorial('5')).to raise_error(ArgumentError)
    end
    it 'should print the factorial of 0 to equal to 1' do
      solver = Solver.new
      expect(solver.factorial(0)).to eq 1
    end
    it 'should should return only the positive integers' do
      expect(Solver.new.positive_integer?(5)).to eq true
    end
    it 'should raise an exception if the number is negative' do
      solver = Solver.new
      expect(solver.positive_integer?(-5)).to raise_error(ArgumentError)
    end
  end
end
