require 'rubygems'
require 'mixology'

module Role
  attr_accessor :name      
end

module Roles
  attr_accessor :roles    
    
  def in_role?(name)    
    roles.has_key?(name) if @roles
  end
  
  def take_roles(*new_roles)
    new_roles.each{|r| take_role r} 
  end
  
  def remove_role(role)
    found_role = roles[role]
    if found_role 
      self.unmix found_role
      roles.delete role
    end
  end

  def remove_roles(*rem_roles)
    rem_roles.each{|r| remove_role r}     
  end

  
  def take_role(role)    
    found_role = world.role(role)
    if found_role 
      @roles ||= {}    
      puts "role:" + found_role.inspect 
      @roles[role] = found_role
      self.mixin found_role
    else
      raise RoleNotFound, "role not found: #{role}"
    end
  end
end  
