require 'life/muscles'
require 'life/motors'
require 'test/unit'

require 'life/organic'
require 'life/limb'

module LimbicSystem
  extend Motor
  
  # move muscle  
  def wave_arms
    move_arm
    "arms waved"
  end
end

module Hand
end

module Bicep
  extend Muscle
  
  # move skeleton object
  def move_arm
    set_arm "up"
    "moved arm bone" 
  end
end

module Brain
end


class P < Organic
end


class TestRole < Test::Unit::TestCase

 def test_motors

   layers = [:muscles, :motors]
   p = P.new({:layers => layers})
               
   p.add_muscle(Bicep)
   assert_equal("moved arm bone", p.move_arm)     
   
   p.set_arm "down"   
   
   assert_raise NotAMotor do 
     p.add_motor(Hand)
   end

   p.add_motor(LimbicSystem)
   res = p.wave_arms
   assert_equal("arms waved", res)     
           
 end

end
