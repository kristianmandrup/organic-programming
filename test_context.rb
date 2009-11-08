require 'life/world'
require 'life/role'
require 'test/unit'

class Thing
  attr_accessor :world
  attr_accessor :contexts

  def initialize(options)
    @world ||= options[:world] || {}
    @contexts ||= options[:contexts] || {}
  end
  
  def use_roles
    class << self
      include Roles
    end
  end
  
  def apply_context context
    found_context = world.context(context)
    contexts[context.to_sym] = found_context  
  end
end  

class Person < Thing  
end

module PaintShop
  class << self
    def paint(roles)
      if roles.has_key? :painter
        "masterpiece"
      end
    end
  end
end 

module Painter 
  include Role
  
  def paint
    puts "paint"
    contexts.each do |key, context|      
      if context.respond_to? :paint
        res = context.paint(roles) 
        return res if !res.nil?
      end
    end      
    "picture"
  end  
end

class TestRole < Test::Unit::TestCase

 def test_apply_context
    world = World.instance
    world.roles = {:painter => Painter}
    world.contexts = {:paintshop => PaintShop}
    p = Person.new({:world => world})
    p.use_roles            
        
    p.take_role(:painter) 
    assert_equal("picture", p.paint)
    p.apply_context :paintshop
    assert_equal("masterpiece", p.paint)
  end

end
