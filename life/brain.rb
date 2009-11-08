# A brain object has methods that can control one or more lower level methods such as motors, muscles (and nerves)
# brain methods are prefixed with process_

class NotABrain < RuntimeError; end

module Brains    
  attr_accessor :brains

  def add_brain_proc(id, proc)
    @brains ||= {}          
    @brains[id.to_sym] = proc
  end


  def add_brain(clazz)
    if clazz.kind_of? Brain
      self.mixin clazz 
    else
      raise NotABrain, "not a brain"
    end
  end

  def remove_brain_proc(id)
    @brains ||= {}          
    @brains.delete(id)
  end  
  
  def brain_missing(id, *args)
    puts "brain missing: #{id}"
    nil
  end
    
end


module Brain
end
