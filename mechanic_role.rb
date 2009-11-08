require 'life_controller'
require 'role'

# add extra power to arm, upgrade eyes
# add brainware method :repair
class Mechanic < Role
  def initialize(*args)
    super(self.class)
  end
  
  module Muscles
    class Arm
      def use(thing)
        puts "Using mechanic arm on #{thing}"
      end
    end
  end

  module Motors
    def do_repair(thing)
      if thing.role_of? Car
        get_arm.use(thing)
      else
        raise RepairRoleError, "As A Mechanic I Can Only Repair Cars"
      end
    end
  end

  module Brainware
    # repairs a thing
    def repair(thing, options) 
      if do_repair     
        puts "Repaired: #{thing}"
      else
        puts "Could not repair: #{thing}"
      end
    end
  end
end

life_controller.set_role("mechanic", Mechanic)