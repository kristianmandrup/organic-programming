# A motoric object has methods that can control one or more muscles
# motoric methods are prefixed with move_

class NotAMotor < RuntimeError; end

module Motors    
  attr_accessor :motors

  def add_motor_proc(id, proc)
    add_motors    
    @motors ||= {}          
    @motors[id.to_sym] = proc
  end


  def add_motor(clazz)
    add_motors
    if clazz.kind_of? Motor
      self.mixin clazz 
    else
      puts "not motor"
      raise NotAMotor, "not a motor"
    end
  end

  def remove_motor_proc(id)
    @motors ||= {}          
    @motors.delete(id)
  end  
  
  def motor_missing(id, *args)
    puts "motor missing: #{id}"
    nil
  end
    
end


module Motor
end
  