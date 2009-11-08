class SuperMechanic < Role
  
  module Motors
    def do_repair(thing)
      if thing.kind_of? Electronic
        get_arm.use(thing)
      else
        raise RepairRoleError, "As A Super Mechanic I Can Only Repair Electronics"
      end
    end
  end  
end