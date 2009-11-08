require 'limb'
require 'tools'

class Person < Living
  def initialize(options)
    super(options)
    set_age(options[:age])
    connect_father(options[:father] || nil)  
  end  
  
  def calculate_family_age    
    person_ages = persons.each{|p| p.get_age}
    calculator.add(person_ages)
  end
end

father = Person.new({:age => 64})
son = Person.new({:age => 32, :father => father})

sci_calculator = Calculator.new(:scientific)
son.grab_calculator(sci_calculator)
# son.calculate_family_age
son.drop_calculator
puts son