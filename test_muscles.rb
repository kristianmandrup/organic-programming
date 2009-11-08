require 'life/muscles'
require 'test/unit'

require 'life/organic'

module Bicep
  extend Muscle
  
  def move_arm
    "moved arm bone"
  end
end

module Brain
end

class P < Organic
end


class TestRole < Test::Unit::TestCase

 def test_muscles

   p = P.new({:skeleton => {:bone => "spine"}})
   p.set_head "cranium"
   
   assert_equal("spine", p.get_bone)
   assert_equal("cranium", p.get_head)  
   
   assert_raise NotAMuscle do 
     p.add_muscle(Brain) 
   end
         
   p.add_muscle(Bicep)
   assert_equal("moved arm bone", p.move_arm)     
  end

end
