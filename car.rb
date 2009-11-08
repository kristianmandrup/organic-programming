class Car < Role
end

class Electronic 
  attr_accessor :name
  def initialize(name)
    @name ||= name    
  end
end