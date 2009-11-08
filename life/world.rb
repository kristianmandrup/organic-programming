# a registry of roles
# each role can consist of multiple parts applied on the object
# - skeleton, muscles, motors, brainware, sensors, nerves
require 'rubygems'
require 'singleton'

class World
  include Singleton
  
  attr_accessor :roles
  attr_accessor :contexts
  attr_accessor :organics  
  
  def initialize
    @roles ||= {}
  end  

  def register(options)
    options.each do |key, values|
      k = key.to_sym      
      target = organics[k]
      if values.kind_of? Array
        values.each{|v| target << v.to_sym}
      else
        target << values.to_sym
      end
      target.compact!
      target.flatten! if target
    end
  end
    
  
  def role(id)
    roles[id.to_sym]    
  end

  def role=(id, role)
    roles[id.to_sym] = role    
  end

  def add_roles(hash)
    roles.merge!(hash)
  end

  def context(id)
    contexts[id.to_sym]    
  end

  def context=(id, context)
    context[id.to_sym] = context    
  end

  def add_contexts(hash)
    contexts.merge!(hash)
  end


end