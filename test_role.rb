require 'life/world'
require 'life/role'
require 'test/unit'

class Thing
  attr_accessor :world
  def initialize(world)
    @world ||= world
  end
  
  def use_roles
    class << self
      include Roles
    end
  end
end  

class Person < Thing  
end

module Painter 
  include Role
  
  def paint
    "picture"
  end  
end


class TestRole < Test::Unit::TestCase

 def test_apply_role
    world = World.instance
    world.roles = {:painter => Painter}
    p = Person.new(world)
    p.use_roles    
    
    assert_raise NoMethodError do p.paint; end
    
    p.take_role(:painter) 
    assert_equal("picture", p.paint)
    assert(p.in_role?(:painter), "should be in role as painter")    
    p.remove_role(:painter)
    assert(!p.in_role?(:painter), "should not be in role as painter")    
    
    assert_raise NoMethodError do p.paint; end
  end

end
