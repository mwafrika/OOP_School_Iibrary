require './student_class'

describe Student do
  context 'Text the student class' do
    student = Student.new(age:18, name: 'Tayo', classroom: 'ss1', parent_permission: true)

    it 'should have the class of student' do
      expect(student.instance_of?(Student)) == true
    end

    it 'should have the exact age 14, name Tayo and parent permission false' do
      expect(student.age).to eq 18
      expect(student.name).to eq 'Tayo'
      expect(student.parent_permission).to eq true
      expect(student.classroom).to eq 'ss1'
    end
  end
end