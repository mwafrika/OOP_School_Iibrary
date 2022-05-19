class Calc
    def calculate
        20 + 23
    end
end

describe Calc do
    context "should print the sum" do
        it('should print sum') do 
            sum = Calc.new.calculate
            expect(sum).to eq 43  
        end
    end
end  
