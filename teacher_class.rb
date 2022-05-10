require './person_class'

class Teacher < Person
  def initialize(specialization, name = 'Unknown', parent_permission = true)
    super(30, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# testing
permission = Teacher.new('Computer science')
print permission.can_use_services?
