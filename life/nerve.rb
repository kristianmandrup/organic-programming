# A nerve has methods that can control one or more motor functions or muscles
class Nerve
  
  def initialize(args)
    super(args)
    @nerves ||= {}    
  end        

  module NerveSystem    
    attr_accessor :nerves
  
    # TODO: refactor
    def add_nerve(id, proc)
      @nerves ||= {}          
      @nerves[id.to_sym] = proc
    end

    def remove_nerve(id, proc)
      @nerves ||= {}          
      @nerves.delete(id)
    end    
  end
  
  include NerveSystem
end