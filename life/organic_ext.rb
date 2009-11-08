require 'life/limb'

class Organic
  include Limb
  attr_accessor :method_missing_list
  attr_accessor :skeleton
  attr_accessor :config

  def initialize(options = {})
    @skeleton ||= options[:skeleton] || {}   
    init
    add_muscles
  end

  def init
    @config ||= {}     
  end    

  def add_tools
    init    
    config[:tools] ||= false
    return if config[:tools]
    
    self.mixin Tools
    @method_missing_list ||= []        
    @method_missing_list << Proc.new {|id, args| tool_missing id, args}    
    config[:tools] = true    
  end


  def add_brains
    init    
    config[:brains] ||= false
    return if config[:brains]

    self.mixin Brains
    @method_missing_list ||= []    
    @method_missing_list << Proc.new {|id, args| brain_missing id, args}    
    config[:brains] = true
  end

  def add_motors
    puts "add motors"
    init
    config[:motors] ||= false
    return if config[:motors]

    puts "mixin motors"

    self.mixin Motors
    @method_missing_list ||= []    
    @method_missing_list << Proc.new {|id, args| motor_missing id, args}    
    
    config[:motors] = true    
  end

  def add_muscles
    init    
    config[:muscles] ||= false
    return if config[:muscles]

    self.mixin Muscles
    @method_missing_list ||= []    
    @method_missing_list << Proc.new {|id, args| muscle_missing id, args}    
    
    config[:muscles] = true            
  end

  def method_missing(id, *args)
    @method_missing_list.each do |mm|
      res = mm.call(id, args)
      return res if !res.nil?
    end
    nil
  end
end
