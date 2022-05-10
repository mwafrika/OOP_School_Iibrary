class Person
  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    return true if is_of_age? || @parent_permission
  end

  private

  def is_of_age?
    @age >= 18
  end
end

# testing
test1 = Person.new(18, 'John', true)
print test1.can_use_services?
