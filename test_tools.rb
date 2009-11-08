require 'life/muscles'
require 'life/motors'
require 'life/brain'
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
  def move_arm(position)
    set_arm "up"
    "moved arm bone #{position}" 
  end
end

module TrowBrain
  extend Brain
  
  def throw_tool(tool)
    grab tool
    move_arm("back")
    move_arm("forward")
    arm_release tool
  end  
end


class P < Organic
end


class TestRole < Test::Unit::TestCase

 def test_tools

   layers = [:muscles, :motors, :brains, :tools]
   p = P.new({:layers => layers})

   p.add_muscle(Bicep)   

   p.add_motor(LimbicSystem)

   p.add_brain(TrowBrain)
   p.throw_tool(:spear)       
 end

end
