# a living organism has sensors retrieve information (or energy) from external objects
# sensors will sense external information
# some sensors can react back
class Living < Organism
  # hashmap : can NOT be persisted
  attr_accessor :sensors
  
  def initialize(*args)
    @sensors = {}     
    @tools ||= {}    
  end
  
  module Sensors
    def add_sensor(id, proc)
      @sensors[id.to_sym] = proc
    end

    def remove_sensor(id, proc)
      @sensors.delete(id)
    end      
    
    def sensor_missing(id, *args)
      set(:sensors, $1, *args) if /sense_(.+)/.match(id.to_s)
      get(:sensors, $1, *args) if /react_(.+)/.match(id.to_s)
    end
  end    


  
  include Tools  
  include Sensors
  
  def method_missing(id, *args)
    sensor_missing id, args
    tool_missing id, args
  end
  
end