require_relative 'solver'

describe 'Should handle the factorial of a number' do
  context 'Should test all the cases in the factorial' do
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

describe 'should handle the reverse word function' do
  context 'Should test the cases in the reverse function' do
    it 'should return a reversed string' do
      solver = Solver.new
      expect(solver.reverse('hello')).to eq 'olleh'
    end
    it 'should return only a string' do
      solver = Solver.new
      expect(solver.reverse?(3333)).to raise_error(ArgumentError)
    end
  end
end
