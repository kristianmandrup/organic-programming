module SpearThrower
  extend Role
  
  # each layer maps to one or more modules that will be apllied on the object runtime, the keys are looked up in a registry!
  def layers
    [ :muscles => [:biceps, :triceps], 
      :motors => :limbic, 
      :brains => :throwing, 
      :tools => :spear
    ]
  end
    
end