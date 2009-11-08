require 'life/muscles'
require 'test/unit'

class SimpleThing < Organic  
  attr_accessor :bone
  
  def initialize(options)
    @bone = options[:bone]
  end
end

class TestRole < Test::Unit::TestCase

 def test_organic
    world = World.instance
    bone = "spine"
    cell = Cell.new(bone)
    cell.mixin Muscles  
        
    assert_equal(bone, cell.get_bone)    
  end

end
