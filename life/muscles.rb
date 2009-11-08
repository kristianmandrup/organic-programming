require 'rubygems'
require 'mixology'
require 'organic'

class NotAMuscle < RuntimeError; end

module Muscles
  # hashmap : can be persisted
  attr_accessor :skeleton
  attr_reader :muscles

  @muscles = []

  def muscle_missing(id, *args)
    if /set_(.+)/.match(id.to_s)
      set(:skeleton, $1, *args) 
    elsif /get_(.+)/.match(id.to_s)
      get(:skeleton, $1, *args)
    end
  end
  
  def add_muscle(clazz)
    add_muscles     
    if clazz.kind_of? Muscle
      @muscles << clazz
      self.mixin clazz 
    else
      raise NotAMuscle, "not a muscle"
    end
  end
  
end  


module Muscle
  @children = []  
  class << self
    attr_reader :children
    def extended(child)
      @children << child
    end
  end  
end


module LegMuscle
  extend Muscle

  @children = []  
  class << self
    attr_reader :children
    def extended(child)
      @children << child
      child.muscles << self
    end
  end
end

class Person < Organic
end

puts LegMuscle.children

layers = [:muscles, :motors]
p = Person.new({:layers => layers})
p.add_muscle LegMuscle
p.muscles




